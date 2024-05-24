.\rem   # Task
Remap JSON file to the following structure:

```
{
      "classes_with_virtual_attributes": [
        {
            "name": "Applications",
            "attributes": [
                {
                    "name": "import_id",
                    "id": 1028
                },
                {
                    "name": "APPID_LOB",
                    "id": 1029
                }
                /*...*/
            ]
        },
        {
            "name": "People",
            "attributes": [
                {
                    "name": "FIRST_LAST",
                    "id": 974
                },
                {
                    "name": "PRIMARY_ADDRESS",
                    "id": 973
                }
                /*...*/
            ]
        }
 
    ]
}
```

Where:
* `classes_with_virtual_attributes[].name` is the name of the classes that has any attribute marked as "virtual": true (example line 2487).
* `classes_with_virtual_attributes[].attributes[].name` is the name of the virtual attribute
* `classes_with_virtual_attributes[].attributes[].id` is the id of the virtual attribute
from the referenced class.
