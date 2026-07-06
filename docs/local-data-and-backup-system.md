# Local Data and Backup System

## Purpose

NoteU will store user data locally on the device first.

The MVP does not require cloud accounts, cloud syncing, or an external database.

Users own their learning data and can export it when they want to move it to another device.

## Core Principle

Local-first.

User-owned.

Exportable.

Portable.

## Local Data Stored

NoteU stores:

- User learning profile
- Notes
- AI categories
- Extracted concepts
- Daily reviews
- Review history
- Identity Score
- Learning Identity Profile
- Knowledge Graph connections
- App settings

## Local Storage Flow

User creates a note  
↓  
NoteU saves it locally  
↓  
AI analysis is saved locally  
↓  
Daily Review uses local notes  
↓  
Identity Score updates locally  
↓  
Knowledge Graph updates locally  

## Backup File Concept

Users can export all NoteU data into one backup file.

Example file:

```text
noteu_backup_2026-07-06.json
