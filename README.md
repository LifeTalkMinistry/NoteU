# NoteU

> **The notes that reveal you.**

NoteU is a local-first learning identity app.

It is not designed to be another place where users dump random notes. It is designed to help users understand what they are learning, why it matters, where they can apply it, and what their learning pattern reveals about who they are becoming.

---

## Product Philosophy

Traditional note apps ask:

> What do you want to write?

NoteU asks:

> What did this learning do to you?

A good note does not only record information. A good note reveals understanding.

---

## MVP Focus

The first version exists to prove one loop:

```text
Learn
  ↓
Write Notes
  ↓
Review Knowledge
  ↓
See Growth
  ↓
Return Tomorrow
```

Everything outside this loop is intentionally postponed.

---

## Core Note Structure

Every NoteU note is built around three questions:

1. **What did I learn?**  
   The main idea, explained in the user’s own words.

2. **Why does this matter?**  
   The value, meaning, or importance of the lesson.

3. **Where can I apply this?**  
   The real-life situation where the learning becomes useful.

This structure prevents NoteU from becoming a passive note dump. It trains users to think deeper, review better, and connect knowledge to life.

---

## MVP Scope

### Included

- Local-first Flutter app foundation
- Structured learning notes
- Daily review flow
- Review history
- Identity Score foundation
- Learning Identity dashboard foundation
- Export and import backup support

### Not Included Yet

- Cloud sync
- Login or user accounts
- Social features
- Shared notes
- Marketplace
- AI chatbot
- Leaderboards
- Courses
- Gamification beyond streaks

---

## Architecture Direction

NoteU is built for long-term maintainability, not quick hacks.

The app follows:

- Flutter
- Clean Architecture
- Feature-first folder structure
- Repository Pattern
- Riverpod for state management and dependency injection
- Local-first storage
- Separation of UI, business logic, storage, models, AI, and utilities

The MVP must stay fully on-device while keeping the architecture ready for future cloud sync without requiring a rewrite.

---

## Build Phases

### Phase 1 — Foundation

Project structure, theme, navigation, local storage, and core models.

### Phase 2 — Notes

Create, edit, delete, and search structured learning notes.

### Phase 3 — Intelligence

AI categorization, concept extraction, and learning domains.

### Phase 4 — Review

Daily review, review engine, and review history.

### Phase 5 — Identity

Identity Score, Identity Dashboard, and Learning Identity.

---

## Guiding Question

Every screen, model, and feature should reinforce one question:

> **What kind of learner am I becoming?**
