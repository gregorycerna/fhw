## Urgent

Note: **Finish the backend *then* worry about the frontend.**

### Labor Czar

Instead of an `Officer` class, there should simply be an `isLaborCzar` column
on the `User` class.

#### Step 1
*Only* a user who `isLaborCzar` can

1. *create* labor positions
2. *assign* labor to people
3. *edit* labor requirements

#### Step 2

1. *sign off* on `Did`s
2. assign labor violations
3. mark labor violations as `recompensed`
4. pronounce other `User`(s) a `LaborCzar`

## Static Pages (outsourced)

1. index
2. about
3. join
4. contact
5. rules (handbook read-only link)
6. list of links to officer descriptions

## Ideas for the future

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

    Recipe (improved)
    ------
    name
    date submitted
    dates cooked
    ingredients
    weblink:URL
    cooks:[User]

