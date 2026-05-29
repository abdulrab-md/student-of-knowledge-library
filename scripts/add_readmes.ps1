param(
    [string]$Root = (Get-Location).ProviderPath
)

$booksRoot = Join-Path $Root 'Books'
if (-not (Test-Path -Path $booksRoot)) {
    Write-Output "Books root not found: $booksRoot"
    exit 1
}

$filesCreated = @()
$dirs = Get-ChildItem -Path $booksRoot -Directory -Recurse -ErrorAction SilentlyContinue
$all = @($booksRoot) + ($dirs | ForEach-Object { $_.FullName })

foreach ($d in $all) {
    $readme = Join-Path $d 'README.md'
    if (-not (Test-Path -Path $readme)) {
        $rel = $d.Substring($Root.Length + 1)
        $content = "# $rel`r`n`r`nThis directory is part of the Books taxonomy."
        Set-Content -Path $readme -Value $content -Encoding UTF8
        $filesCreated += $readme
        Write-Output "CREATED: $readme"
    } else {
        Write-Output "EXISTS: $readme"
    }
}

Write-Output "Done. Created $($filesCreated.Count) README.md files."
