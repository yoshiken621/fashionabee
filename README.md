# README

usersテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |


adviserテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

itemテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| inner              | string | null: false |
|                    | string | null: false |

rooms table
| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

room_users table
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

message table
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| advisor | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |