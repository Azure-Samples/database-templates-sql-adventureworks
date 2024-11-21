<!--
---
page_type: sample
name: Azure SQL Database with AdventureWorks Azure Developer CLI template
description: This AZD template deploys an Azure SQL Database instance with AdventureWorks pre-created as a database.
urlFragment: template
languages:
- azdeveloper
products:
- azure-sql
---
-->

# Azure SQL Database with AdventureWorks Azure Developer CLI template

This template deploys an Azure SQL Database instance with AdventureWorks pre-created as a database.

## Details

| | Value |
| --- | --- |
| **Database name** | `AdventureworksLT` |
| **Username** | `sqladmin` |
| **Password** | `P@ssw.rd` |

## Deploy

```
azd init --template database-templates-sql-adventureworks --environment development
 
azd up
```

## Clean-up

```
azd down --force --purge
```
