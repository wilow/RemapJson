Param (
    [Parameter()]
    [string]
    $inputFile = './ex1.metadata.json',

    [Parameter()]
    [string]
    $outputFile = './output.json'
)


function RetrieveVirtualAttributes($attributes) {
    $virtualAttributes = @()

    foreach ($attribute in $attributes) {
        if ($attribute.virtual) {
            $virtualAttributes += @{
                'name' = $attribute.name
                'id'   = $attribute.id
            }
        }
    }
    return @($virtualAttributes)
}


$inputFilePath = './ex2.metadata.json'

$inputJson = Get-Content -Path $inputFilePath | ConvertFrom-Json
$outputObject = @{
    'classes_with_virtual_attributes' = @()
}

Write-Host "Processing file: $inputFilePath"



$virtualAttributesCount = 0
$classesCount = 0
foreach ($class in $inputJson.classes.PSObject.Properties) {
    $classesCount++

    $virtualAttributes = RetrieveVirtualAttributes($class.value.attributes)
    if ($virtualAttributes.Count -gt 0) {

        $virtualAttributesCount += $virtualAttributes.Count

        $outputObject['classes_with_virtual_attributes'] += @{
            'name'       = $class.value.name
            'attributes' = @($virtualAttributes)
        }
    }
}

Write-Host " - Found classes: " -NoNewline
Write-Host "$($classesCount)" -ForegroundColor Yellow

Write-Host " - Found virtual attributes: " -NoNewline
Write-Host "$virtualAttributesCount" -ForegroundColor Yellow

Write-Host "Finished" -ForegroundColor Green


$outputObject | ConvertTo-Json -Depth 4 | Out-File -FilePath './output.json'