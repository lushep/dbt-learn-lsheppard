
with source as (

    select * from {{ source('ticket_tailor', 'orders') }}

),

renamed as (

    select
        id as order_id,
        refund_amount,
        created_at,
        currency,
        event_summary,
        line_items,
        object,
        status,
        subtotal,
        tax,
        total,
        txn_id,
        _sdc_batched_at,
        _sdc_received_at,
        _sdc_sequence,
        _sdc_table_version

    from source

)

select * from renamed
