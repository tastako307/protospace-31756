＊users
| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| email      | string | null: false |
| password   | string | null: false |
| name       | string | null: false |
| profile    | text   | null: false |
| occupation | text   | null: false |
| position   | text   | null: false |

*Associate
has_many :comment
has_many :prototype

*comments 
| Column    | Type        | Options                          |
| --------- | ----------- | -------------------------------- |
| text      | text        | null: :false                     |
| user      | reference   | null: :false, foreign_key: :true |
| prototype | reference   | null: :false, foreign_key: :true |

*Associate
belongs_to :user
belongs_to :prototype

*prototypes
| Column     | Type      | Options                        |
| ---------- | --------- | ------------------------------ |
| title      | string    | null:false                     |
| catch_copy | text      | null:false                     |
| concept    | text      | null:false                     |
| image      |           | null:false, foreign_key: :true |
| user       | reference | null:false, foreign_key: :true |

*Associate
has_many: comment
belongs_to: user

