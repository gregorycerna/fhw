Step 1
======

Visitor (static pages)
-------
index
about
join
contact
rules (handbook read-only link)
list of links to officer descriptions

Step 2
======

Recipe
------
txt region for desired ingredients
    there should be a route to be able
    to download a collated list of all
    desired ingredients for the next
    week like so:
      ---------------------
      | * RECIPE TITLE *  |
      |  ingr 1           |
      |  ingr 2           |
      | * RECIPE TITLE *  |
      |  ingr 1           |
      |  ingr 2           |
      ---------------------
URL
date submitted
date to serve
submitter:User

Step 3
======

User (improved)
------
name
email/password (devise)
officerships:[Officer]
recipes:[Recipe]
car
permanent address
phone number
emergency contact

Step 4
======

Recipe (improved for Greg's usage)
------
name
date submitted
dates cooked
ingredients
weblink:URL
cooks:[User]

Step 5
======

Officer
-------
title
description
holders:[User]

Step 6 (Labor management system)
================================

Labor
-----
name
description
dueday:DayOfTheWeek
:[Task]
:User   # one User per labor.
:[Did]

Task (nested route)
----
description
:Labor  # this was my mistake last time

Done (sub-nested shallow)
--------
:Task
complete:boolean

Did (nested route)
---
date
notes (optnl)
:Labor
:[Done]
+complete:boolean {return dones.all?;}

