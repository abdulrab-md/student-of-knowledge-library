# Islamic Library

A structured digital library for Islamic books, PDFs, audio lessons, and video explanations organized according to the traditional Islamic sciences.

---

## Content Index

The complete folder hierarchy can be found in:

* [`content-index.md`](content-index.md)

This file serves as the authoritative reference for all categories, sciences, sub-sciences, and folder locations.

---

## Book Files

Every book in this repository must follow the standard book format defined in:

* [`sample-book-template.md`](sample-book-template.md)

The template includes:

* Book metadata
* PDF resources
* Video/Audio resources
* Link formatting rules
* Versioning conventions

### Book Naming Convention

All book files must follow the format:

```text
{T/P}-{L1-L5}-B{NN}_{Placeholder}.md
```

**Type:** `T` (Text), `P` (Poetry)

**Level:** `L1` (Essentials), `L2` (Fundamentals), `L3` (Intermediate), `L4` (Advanced), `L5` (Expert)

**Index:** `NN` = Two-digit index number (`01`, `02`, `03`, ...)

Examples

```text
T-L1-B01_Kitaab_at-Tawheed_Muhammad_ibn_Abd_al-Wahhab.md
T-L1-B02_Usool_ath-Thalaathah_Muhammad_ibn_Abd_al-Wahhab.md
P-L3-B01_Alfiyyah_ibn_Malik.md
T-L3-B05_Al-Waraqaat_Al-Juwayni.md
T-L4-B01_Sahih_al-Bukhari.md
```

### Naming Rules

* Use underscores (`_`) instead of spaces.
* Placeholder should have Book name, and can have additional Author name optionally.
* Preserve well-known transliterations where possible.
* Use a two-digit index number.
* Use the `.md` extension.

---

## Future Expansion

The library structure is designed to support:

* Additional sub-sciences
* Additional languages
* Teacher profiles
* Author profiles
* Reading paths
* Study plans
* Cross-references

The three primary categories (Objective, Instrumental, Supplementary) are considered foundational and should remain stable.