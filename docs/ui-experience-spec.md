# NoteU UI Experience Specification

## Purpose

This document defines the first real product UI direction for NoteU.

The app must not feel like a README, documentation page, or generic note-taking tool.

NoteU should feel like a calm learning identity platform that helps users see who they are becoming through what they learn, write, review, and retain.

## Core Product Feeling

When a user opens NoteU, the first impression should be:

> This app helps me understand how I learn.

Not:

> This is another place to store notes.

The UI must feel:

- Calm
- Premium
- Intelligent
- Reflective
- Minimal
- Fast
- Focused

## Product Journey

The UI should be designed around the core learning loop:

1. Open the app
2. See a clear invitation to learn
3. Write one meaningful structured note
4. Return later to review it
5. See a small signal of growth
6. Come back tomorrow

The user journey matters more than decorative UI.

Every screen should support this question:

> What kind of learner am I becoming?

## MVP UI Principle

Do not build a statistics-heavy dashboard first.

The first screen should not overwhelm the user with analytics, charts, or feature cards.

The MVP experience should begin with clarity:

> What are you learning today?

Then guide the user into the structured note format documented in `docs/note-structure-system.md`.

## Visual Direction

Use a modern, premium, learning-focused design language.

Good references:

- Apple Journal for calm reflection
- Linear for clean hierarchy
- Notion for clarity
- Arc Browser for premium simplicity
- Headspace for approachable calm

Do not copy these products directly.

## Style Rules

Use:

- Large whitespace
- Rounded cards
- Soft borders
- Subtle depth
- Strong readable typography
- Clear hierarchy
- Large tap targets
- Minimal icons
- Calm motion only when needed later

Avoid:

- Clutter
- Loud gradients
- Too many cards
- Random icons
- Dashboard overload
- Documentation-style screens
- Giant generic note fields
- Gamified visuals beyond streaks

## Color Direction

Recommended palette:

- Background: `#F8F9FB`
- Surface: `#FFFFFF`
- Primary: `#3B5BDB`
- Accent: `#6C63FF`
- Success: `#22C55E`
- Text Primary: `#111827`
- Text Secondary: `#6B7280`
- Border: `#E5E7EB`

Colors should support calm focus, not visual noise.

## App Structure

The Phase 1 UI should prepare these main destinations:

- Home
- Review
- Identity
- Settings

Use bottom navigation for the primary app shell.

## Screen Requirements

### Splash Screen

Minimal introduction screen.

Content:

- NoteU
- The notes that reveal you.

No heavy animation is required for MVP.

### Home Screen

The Home screen is not a generic dashboard.

It is the start of the learning journey.

Required content:

- Greeting
- Main prompt: `What are you learning today?`
- Primary action: `New Note`
- Secondary action/card: `Continue Today's Review` or `Continue Review`
- Recent Notes preview
- Learning Identity preview

The identity preview should not feel like a final scorecard yet. It should feel like an early reflection signal.

Example identity preview:

- Learning Identity
- Developing Systems Thinker
- Based on your recent learning themes

### New Note Screen

This is the most important MVP screen.

Do not use one giant empty text box.

The note must follow the documented NoteU structure:

1. What did I learn?
2. Why does this matter?
3. Where can I apply this?

Each section should have its own large writing area.

Optional fields may be collapsed or visually secondary:

- Source
- Category
- Tags
- Difficulty
- Personal reflection
- Related notes

Primary action:

- Save Note

The screen should make the user feel guided into deeper thinking.

### Review Screen

The Review screen should help the user revisit learning calmly.

Required content:

- Today's Review
- One review card at a time
- Clear note concept preview
- Simple review actions

Actions:

- Remembered
- Needs Review

Do not implement the full review engine in UI foundation unless the phase explicitly asks for it.

### Identity Screen

The Identity screen should feel inspirational, not technical.

Required content:

- Your Learning Identity
- Primary learning domain preview
- Current streak preview
- Knowledge reviewed preview
- Growth over time preview
- Recent learning themes preview

Do not invent final calculations.

Use placeholder UI states only until the identity engine is implemented.

### Settings Screen

Keep this simple and practical.

Required content:

- Export Backup
- Import Backup
- Appearance
- About NoteU

Do not add accounts, login, cloud sync, or social settings.

## Component System

Create reusable components before duplicating UI.

Suggested components:

- AppScaffold
- BottomNavigationShell
- PrimaryButton
- SecondaryButton
- SectionHeader
- NoteUCard
- NoteCard
- IdentityPreviewCard
- ReviewCard
- EmptyState
- TagChip
- StructuredTextField

Every component should have one responsibility.

## Architecture Rules

Follow the existing Flutter Clean Architecture direction.

Keep UI separate from:

- Business logic
- Storage
- Models
- AI logic
- Utilities

Do not put product calculations inside widgets.

Do not create giant widgets.

Do not create giant screens with all UI inline.

## MVP Boundaries

Do not implement:

- Cloud sync
- Login
- User accounts
- Social features
- Shared notes
- Marketplace
- AI chatbot
- Leaderboards
- Courses
- Gamification beyond streaks

Do not implement advanced scoring or AI behavior unless the related phase explicitly starts.

## Implementation Instruction for AI Engineers

Before coding each UI feature:

1. Explain what will be built.
2. Explain why it supports the NoteU learning loop.
3. Explain where it belongs in the architecture.
4. Then write production-ready Flutter code.

Never dump large code without architectural context.

## Success Standard

The UI is successful when a first-time user immediately understands:

- NoteU is about learning growth, not random notes.
- The app wants them to write meaningful notes.
- Review is part of the product, not an afterthought.
- Their learning behavior will eventually reveal their identity.

The UI should make the user want to answer:

> What did I learn today?
