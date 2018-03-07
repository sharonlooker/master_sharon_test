connection: "thelook"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

datagroup: sharon_test_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: sharon_test_default_datagroup

explore: users {
  join: orders {
    type: left_outer
    relationship: one_to_many
    sql_on: ${users.id}= ${orders.user_id} ;;
  }
}
