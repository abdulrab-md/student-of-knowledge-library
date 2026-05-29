param(
    [string]$Root = (Get-Location).ProviderPath,
    [switch]$RemoveHyphenDuplicates
)

$paths = @(
"Books\\Objective\\Aqeedah\\Tawheed",
"Books\\Objective\\Aqeedah\\Aqeedah",
"Books\\Objective\\Aqeedah\\'Itiqaad",
"Books\\Objective\\Aqeedah\\Manhaj",

"Books\\Objective\\Fiqh\\Fiqh Madhhabb\\Hanafi Fiqh",
"Books\\Objective\\Fiqh\\Fiqh Madhhabb\\Maaliki Fiqh",
"Books\\Objective\\Fiqh\\Fiqh Madhhabb\\Shaafi'i Fiqh",
"Books\\Objective\\Fiqh\\Fiqh Madhhabb\\Hanbali Fiqh",
"Books\\Objective\\Fiqh\\Fiqh Madhhabb\\Dhaahiri Fiqh",
"Books\\Objective\\Fiqh\\Fiqh Ghayr Madhhabb",
"Books\\Objective\\Fiqh\\Hadith al-Ahkaam",
"Books\\Objective\\Fiqh\\Specific Topics of Fiqh",

"Books\\Objective\\Hadith\\Primary Collections",
"Books\\Objective\\Hadith\\Secondary Collections",
"Books\\Objective\\Hadith\\Arba'oon Collections",
"Books\\Objective\\Hadith\\Specific Topics of Hadith",

"Books\\Objective\\Lughah al-Arabiyyah\\Nahw",
"Books\\Objective\\Lughah al-Arabiyyah\\Sarf",
"Books\\Objective\\Lughah al-Arabiyyah\\Balaaghah",
"Books\\Objective\\Lughah al-Arabiyyah\\Qaamoos",

"Books\\Objective\\Seerah an-Nabi\\Mukhtasar Seerah an-Nabi",
"Books\\Objective\\Seerah an-Nabi\\Waasi' Seerah an-Nabi",
"Books\\Objective\\Seerah an-Nabi\\Specific Topics of Seerah",

"Books\\Objective\\Tafseer\\Mukhtasar Tafseer",
"Books\\Objective\\Tafseer\\Waasi' Tafseer",
"Books\\Objective\\Tafseer\\Specific Topics of Tafseer",
"Books\\Objective\\Tafseer\\Translations",

"Books\\Instrumental\\Uloom al-Aqeedah\\Uloom al-Firaq",
"Books\\Instrumental\\Uloom al-Aqeedah\\Uloom al-Ad'iyaan",
"Books\\Instrumental\\Uloom al-Aqeedah\\Atheism & Other Ideologies",
"Books\\Instrumental\\Uloom al-Aqeedah\\Specific Topics of Aqeedah",

"Books\\Instrumental\\Uloom al-Fiqh\\Usool al-Fiqh\\Hanafi Usool al-Fiqh",
"Books\\Instrumental\\Uloom al-Fiqh\\Usool al-Fiqh\\Maaliki Usool al-Fiqh",
"Books\\Instrumental\\Uloom al-Fiqh\\Usool al-Fiqh\\Shaafi'i Usool al-Fiqh",
"Books\\Instrumental\\Uloom al-Fiqh\\Usool al-Fiqh\\Hanbali Usool al-Fiqh",
"Books\\Instrumental\\Uloom al-Fiqh\\Usool al-Fiqh\\Dhaahiri Usool al-Fiqh",
"Books\\Instrumental\\Uloom al-Fiqh\\Usool al-Fiqh\\Ghayr Madhaahib Usool al-Fiqh",

"Books\\Instrumental\\Uloom al-Fiqh\\Qawaa'idh al-Fiqh\\Hanafi Qawaa'idh al-Fiqh",
"Books\\Instrumental\\Uloom al-Fiqh\\Qawaa'idh al-Fiqh\\Maaliki Qawaa'idh al-Fiqh",
"Books\\Instrumental\\Uloom al-Fiqh\\Qawaa'idh al-Fiqh\\Shaafi'i Qawaa'idh al-Fiqh",
"Books\\Instrumental\\Uloom al-Fiqh\\Qawaa'idh al-Fiqh\\Hanbali Qawaa'idh al-Fiqh",
"Books\\Instrumental\\Uloom al-Fiqh\\Qawaa'idh al-Fiqh\\Dhaahiri Qawaa'idh al-Fiqh",
"Books\\Instrumental\\Uloom al-Fiqh\\Qawaa'idh al-Fiqh\\Ghayr Madhaahib Qawaa'idh al-Fiqh",

"Books\\Instrumental\\Uloom al-Fiqh\\Madhaahib al-Fiqh\\Hanafi",
"Books\\Instrumental\\Uloom al-Fiqh\\Madhaahib al-Fiqh\\Maaliki",
"Books\\Instrumental\\Uloom al-Fiqh\\Madhaahib al-Fiqh\\Shaafi'i",
"Books\\Instrumental\\Uloom al-Fiqh\\Madhaahib al-Fiqh\\Hanbali",
"Books\\Instrumental\\Uloom al-Fiqh\\Madhaahib al-Fiqh\\Dhaahiri",

"Books\\Instrumental\\Uloom al-Hadith\\Ahmiyat as-Sunnah",
"Books\\Instrumental\\Uloom al-Hadith\\Mustalah al-Hadith",
"Books\\Instrumental\\Uloom al-Hadith\\Usool al-Hadith",
"Books\\Instrumental\\Uloom al-Hadith\\'Ilm ar-Rijaal",
"Books\\Instrumental\\Uloom al-Hadith\\Jarh wat-Ta'dheel",

"Books\\Instrumental\\Uloom al-Qur'aan\\Ahmiyat al-Qur'aan",
"Books\\Instrumental\\Uloom al-Qur'aan\\Tajweed",
"Books\\Instrumental\\Uloom al-Qur'aan\\Specific Topics on Qur'aan",

"Books\\Instrumental\\Uloom as-Seerah\\Shamaail an-Nabi",
"Books\\Instrumental\\Uloom as-Seerah\\Khasaais an-Nabi",
"Books\\Instrumental\\Uloom as-Seerah\\Mu'jizaat an-Nabi",
"Books\\Instrumental\\Uloom as-Seerah\\Specific Topics on Nabi",
"Books\\Instrumental\\Uloom as-Seerah\\Seerah al-Ambiya war-Rusul",
"Books\\Instrumental\\Uloom as-Seerah\\Seerah as-Sahaabah was-Sahaabiyyaat",
"Books\\Instrumental\\Uloom as-Seerah\\Seerah at-Taa'bioon wa Atba' at-Taabi'oon",
"Books\\Instrumental\\Uloom as-Seerah\\Seerah A'immah al-Muslimeen",
"Books\\Instrumental\\Uloom as-Seerah\\Taareekh al-Islaamiyyah",
"Books\\Instrumental\\Uloom as-Seerah\\Specific Topics in Taareekh",

"Books\\Instrumental\\Uloom at-Tafseer\\Usool at-Tafseer",
"Books\\Instrumental\\Uloom at-Tafseer\\Asbaab an-Nuzool",
"Books\\Instrumental\\Uloom at-Tafseer\\Specific Topics on Tafseer",

"Books\\Supplementary\\Ta'leem\\Talab al-'Ilm",
"Books\\Supplementary\\Ta'leem\\ad-Dhikr wad-Du'aa",
"Books\\Supplementary\\Ta'leem\\al-Ash'hoor al-Islaamiyyah",

"Books\\Supplementary\\Tarbiyah\\Aadaab",
"Books\\Supplementary\\Tarbiyah\\Huqooq",
"Books\\Supplementary\\Tarbiyah\\Amaal al-Qalb",
"Books\\Supplementary\\Tarbiyah\\Mawaa'idh",

"Books\\Supplementary\\Tazkiyah\\Ruqyah",
"Books\\Supplementary\\Tazkiyah\\Tazkiyah an-Nafs",
"Books\\Supplementary\\Tazkiyah\\Zuhd",
"Books\\Supplementary\\Tazkiyah\\Tibb",

"Books\\Supplementary\\Raqaaeq\\Dunya",
"Books\\Supplementary\\Raqaaeq\\Aakhirah",
"Books\\Supplementary\\Raqaaeq\\Zawaajir",
"Books\\Supplementary\\Raqaaeq\\az-Zunoob wal-Ma'aasi",

"Books\\Supplementary\\Dawah\\ad-Da'wah wad-Da'yee",
"Books\\Supplementary\\Dawah\\Manhajiyyah fid-Da'wah",
"Books\\Supplementary\\Dawah\\Naseehah",
"Books\\Supplementary\\Dawah\\Specific Topics in Dawah"
)

$expectedFull = $paths | ForEach-Object { Join-Path -Path $Root -ChildPath $_ }

$created = @()
$exists = @()

foreach ($full in $expectedFull) {
    if (-not (Test-Path -Path $full)) {
        New-Item -Path $full -ItemType Directory -Force | Out-Null
        $created += $full
        Write-Output "CREATED: $full"
    }
    else {
        $exists += $full
        Write-Output "EXISTS: $full"
    }
}

if ($RemoveHyphenDuplicates) {
    Write-Output "\nScanning for hyphen-style duplicates..."
    $allDirs = Get-ChildItem -Path (Join-Path $Root 'Books') -Directory -Recurse -ErrorAction SilentlyContinue
    $removed = @()
    foreach ($d in $allDirs) {
        if ($expectedFull -notcontains $d.FullName) {
            $norm = $d.FullName -replace '-', ' '
            if ($expectedFull -contains $norm) {
                Remove-Item -Path $d.FullName -Recurse -Force
                $removed += $d.FullName
                Write-Output "REMOVED DUPLICATE: $($d.FullName)"
            }
        }
    }
    if ($removed.Count -eq 0) { Write-Output "No hyphen-style duplicates found." }
}

Write-Output "\nSUMMARY: $($expectedFull.Count) paths checked, $($created.Count) created, $($exists.Count) already existed."
