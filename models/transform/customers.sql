with customers as (

    select * from {{var('customers_table')}}

),

orders as (

    select * from {{ref('orders')}}

),

joined as (

    select
        customers.*,
        orders.order_number,
        orders.created_at as first_order_date
    from customers
    left join orders using (customer_id)

),

first_orders as (

    select * from joined
    where order_number = 1
)

select * from first_orders
