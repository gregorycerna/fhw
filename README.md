## TODOS

1. __Pundit for labor-czar__ --- see links
2. __Capitulation__ --- pronounce other `User`(s) a `LaborCzar`
3. __email__ --- see links

### Maintenance v1.0

    MaintenanceRequest
    --------
    name
    initiator:User
    description:text
    has_many:[Comment]
    done:boolean

    Comment
    -------
    references:User
    comment:text
    belongs_to:MaintenanceRequest

### Maintenance v1.1

    MaintenanceRequest
    ------------------
    ...
    :[Pictures]

    Comment
    -------
    ...
    :[Pictures]

### Maintenance v1.2

    MaintenanceRequest
    --------
    ...
    :[Tags]

    Tag
    ---
    name

### Events

    Event
    -----
    name
    description
    date

### In place editing

Replace the "Czar Panel" with something integrated into the normal interface
   using that inline editing thing from `Trracker`

### House directory

    User
    ----
    ... # existing stuff
    car
    room:integer
    phone number
    emergency contact name
    emergency contact phone number
    dietary restrictions
