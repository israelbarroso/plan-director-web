#Requires -Modules powershell-yaml
param(
  [string]$ProjectRoot = (Get-Location).Path,
  [string]$MkdocsPath = "mkdocs.yml",
  [string]$DocsDir = "docs",
  [string]$OutputDir = "site",
  [string]$OutputName = "PlanDirector2025",
  [string]$ReferenceDoc = "plantilla-oip.docx",   # opcional
  [switch]$NoPDF                                     # usa -NoPDF si no quieres PDF
)

function Assert-Tool($name) {
  if (-not (Get-Command $name -ErrorAction SilentlyContinue)) {
    throw "No se encontró '$name' en PATH. Instala o abre nueva consola. Herramienta requerida."
  }
}

function Resolve-NavFiles {
  param([object]$Nav, [string]$DocsDir)

  $result = New-Object System.Collections.Generic.List[string]
  function Add-Entry([object]$entry) {
    if ($entry -is [hashtable]) {
      foreach ($k in $entry.Keys) {
        $v = $entry[$k]
        if ($v -is [string]) {
          $path = Join-Path $DocsDir $v
          if (Test-Path $path) { $result.Add($path) } else { Write-Warning "No existe: $path" }
        } elseif ($v -is [System.Collections.IEnumerable]) {
          foreach ($child in $v) { Add-Entry $child }
        }
      }
    } elseif ($entry -is [string]) {
      $path = Join-Path $DocsDir $entry
      if (Test-Path $path) { $result.Add($path) } else { Write-Warning "No existe: $path" }
    }
  }

  foreach ($item in $Nav) { Add-Entry $item }
  # Orden único y sin duplicados
  return $result | Select-Object -Unique
}

try {
  Push-Location $ProjectRoot

  # 1) Comprobaciones
  Assert-Tool pandoc
  if (-not (Test-Path $MkdocsPath)) { throw "No se encuentra $MkdocsPath en $ProjectRoot" }
  if (-not (Test-Path $DocsDir)) { throw "No se encuentra carpeta '$DocsDir' en $ProjectRoot" }

  # 2) Carga YAML
  $yaml = Get-Content -Raw $MkdocsPath | ConvertFrom-Yaml
  if (-not $yaml.nav) { throw "Tu mkdocs.yml no tiene sección 'nav'. Añádela o genera una mínima." }

  # 3) Archivos en orden de navegación
  $files = Resolve-NavFiles -Nav $yaml.nav -DocsDir $DocsDir

  # 3.1) Inserta portada (si existe) como primer documento
  $cover = Join-Path $DocsDir "cover.md"
  if (Test-Path $cover) { $files = ,$cover + $files }

  if ($files.Count -eq 0) { throw "No se localizaron .md a partir de la nav de mkdocs.yml" }

  # 4) Prepara salida
  if (-not (Test-Path $OutputDir)) { New-Item -ItemType Directory -Path $OutputDir | Out-Null }
  $docxOut = Join-Path $OutputDir "$OutputName.docx"
  $pdfOut  = Join-Path $OutputDir "$OutputName.pdf"

  # 5) Argumentos comunes para Pandoc
  $common = @(
    "--from", "gfm",
    "--toc",
    "--resource-path=$DocsDir",
    "--metadata", "title=Plan Director TIC 2025-2027 (OIP)",
    "--metadata", "date=$(Get-Date -Format yyyy-MM-dd)"
  )

  # 6) DOCX con plantilla si existe
  $argsDocx = @()
  $argsDocx += $files
  $argsDocx += $common
  if (Test-Path $ReferenceDoc) {
    $argsDocx += @("--reference-doc=$ReferenceDoc")
  }
  $argsDocx += @("-o", $docxOut)

  Write-Host "→ Generando DOCX: $docxOut"
  & pandoc @argsDocx

  if (-not $NoPDF) {
    # 7) PDF directo (requiere MiKTeX/LaTeX instalado)
    $argsPdf = @()
    $argsPdf += $files
    $argsPdf += $common
    $argsPdf += @(
      "--pdf-engine=xelatex",
      "-o", $pdfOut
    )
    Write-Host "→ Generando PDF: $pdfOut"
    & pandoc @argsPdf
  } else {
    Write-Host "⚠ Saltando PDF por parámetro -NoPDF"
  }

  Write-Host "`nListo. Salidas en: $OutputDir"
  if (Test-Path $docxOut) { Write-Host " - $docxOut" }
  if ((-not $NoPDF) -and (Test-Path $pdfOut)) { Write-Host " - $pdfOut" }
}
catch {
  Write-Error $_.Exception.Message
}
finally {
  Pop-Location
}
