create table agency
(
    agency_id    serial
        constraint agency_pk
            primary key,
    agency_name  varchar(200),
    created_time timestamp,
    updated_time timestamp,
    agency_code  varchar(50),
    address_1    varchar(300),
    address_2    varchar(300),
    contact_1    varchar(100),
    contact_2    varchar(100)
);

alter table agency
    owner to postgres;

create table o_scope
(
    scope_id     serial
        constraint cms_scope_templates_pk
            primary key,
    scope_name   varchar(50),
    created_time timestamp,
    is_deleted   integer,
    o_id         integer,
    updated_time timestamp,
    updated_by   integer,
    created_by   integer
);

alter table o_scope
    owner to postgres;

create table cms_scope_type
(
    scope_type_id    integer not null
        constraint scope_type_pk
            primary key,
    scope_level_name varchar(100),
    created_time     timestamp,
    is_deleted       integer
);

alter table cms_scope_type
    owner to postgres;

create table o_scope_template_mapping
(
    scope_map_id  serial
        constraint o_scope_template_mapping_pk
            primary key,
    scope_id      integer,
    scope_type_id integer,
    filter_id     integer,
    created_time  timestamp
);

alter table o_scope_template_mapping
    owner to postgres;

create table e_address
(
    e_address_id serial
        constraint e_address_pk
            primary key,
    e_id         integer,
    o_id         integer,
    address      text,
    city_id      integer,
    state_id     integer,
    country_id   integer,
    created_time timestamp,
    created_by   integer
);

alter table e_address
    owner to postgres;

create unique index e_address_e_address_id_uindex
    on e_address (e_address_id);

create table employee
(
    alternate_contact_no varchar(20),
    aadhar_card_no       varchar(20),
    security_questions   jsonb,
    e_type               integer,
    e_id                 serial
        constraint new_employee_pk
            primary key,
    e_firstname          varchar(100),
    e_lastname           varchar(100),
    e_email              varchar(80),
    gender               integer default 1,
    contact_no           varchar(20),
    designation          varchar(100),
    is_active            integer default 1,
    is_deleted           integer default 0,
    created_by           bigint,
    created_time         timestamp,
    updated_by           bigint,
    updated_time         timestamp,
    o_id                 bigint,
    user_id              bigint,
    e_code               varchar(100),
    alternate_email      varchar(80),
    working_start_time   timestamp,
    working_end_time     timestamp,
    temp_field_1_value   varchar(100),
    temp_field_2_value   varchar(100),
    temp_field_3_value   varchar(2000),
    audit_remark         varchar(300),
    profile_pic_id       bigint
);

alter table employee
    owner to postgres;

create table m_city
(
    m_city_id    serial
        constraint m_city_pk
            primary key,
    m_city_name  varchar(100),
    m_country_id integer,
    m_state_id   integer,
    is_deleted   integer,
    description  text,
    m_longitude  double precision,
    m_latitude   double precision
);

alter table m_city
    owner to postgres;

create table m_country
(
    m_country_id   integer not null
        constraint m_country_pk
            primary key,
    m_country_name varchar(100),
    description    text,
    is_deleted     integer
);

alter table m_country
    owner to postgres;

create table m_state
(
    m_state_id   serial
        constraint m_state_pk
            primary key,
    m_state_name varchar(100),
    m_country_id integer,
    is_deleted   integer,
    description  text
);

alter table m_state
    owner to postgres;

create table m_location_type
(
    m_location_type_id serial
        constraint m_location_type_pk
            primary key,
    location_name      varchar(100),
    description        text,
    is_deleted         integer
);

alter table m_location_type
    owner to postgres;

create table m_module
(
    module_id       serial
        constraint m_module_pk
            primary key,
    module_name     varchar(100)      not null,
    module_code     varchar(100)      not null,
    permission_json json              not null,
    description     varchar(200),
    icon            varchar(50),
    is_deleted      integer default 0 not null,
    application     varchar(200)
);

alter table m_module
    owner to postgres;

create table m_module_actions
(
    action_id   serial
        constraint m_module_actions_pk
            primary key,
    action_name varchar(100)      not null,
    description varchar(300),
    is_deleted  integer default 0 not null
);

alter table m_module_actions
    owner to postgres;

create table m_organisation_type
(
    o_type_id   serial
        constraint m_organisation_type_pk
            primary key,
    o_type      varchar(100),
    description text,
    is_deleted  integer
);

alter table m_organisation_type
    owner to postgres;

create table m_role
(
    m_role_id   serial
        constraint m_role_pk
            primary key,
    m_role_name varchar(100),
    is_deleted  integer,
    description text,
    m_role_type integer,
    is_admin    integer
);

alter table m_role
    owner to postgres;

create table m_role_applications
(
    m_role_application_id integer not null
        constraint m_role_applications_pk
            primary key,
    application_name      varchar(100),
    application_code      varchar(100),
    permissions           jsonb,
    is_deleted            integer
);

alter table m_role_applications
    owner to postgres;

create table m_role_module
(
    m_role_module_id serial
        constraint m_role_module_pk
            primary key,
    module_code      varchar(100),
    application_code varchar(100),
    permissions      jsonb,
    is_deleted       integer,
    module_name      varchar(100)
);

alter table m_role_module
    owner to postgres;

create table o_area
(
    area_id      serial
        constraint o_area_pk
            primary key,
    area_name    varchar(100),
    area_code    varchar(50),
    region_id    integer,
    is_deleted   integer,
    created_time timestamp,
    updated_time timestamp,
    created_by   integer,
    updated_by   integer,
    o_id         integer,
    is_active    integer,
    description  text,
    comments     text,
    temp_field_1 varchar(100),
    temp_field_2 varchar(100),
    temp_field_3 varchar(100)
);

alter table o_area
    owner to postgres;

create table o_region
(
    region_id    serial
        constraint o_region_pk
            primary key,
    region_name  varchar(200),
    region_code  varchar(50),
    is_deleted   integer,
    created_time timestamp,
    updated_time timestamp,
    created_by   integer,
    updated_by   integer,
    o_id         integer,
    is_active    integer,
    description  text,
    comments     text,
    temp_field_1 varchar(100),
    temp_field_2 varchar(100),
    temp_field_3 varchar(100)
);

alter table o_region
    owner to postgres;

create table o_site
(
    site_id       serial
        constraint o_site_pk
            primary key,
    site_name     varchar(100)      not null,
    site_code     varchar(20)       not null,
    description   varchar(300),
    address_line1 varchar(300),
    address_line2 varchar(300),
    city_id       bigint,
    area_id       bigint,
    o_id          bigint            not null,
    is_deleted    integer default 0 not null,
    is_active     integer default 1 not null,
    created_by    bigint            not null,
    created_time  timestamp         not null,
    updated_by    bigint,
    updated_time  timestamp,
    state_id      bigint,
    country_id    bigint,
    comments      varchar(300),
    temp_field_1  varchar(100),
    temp_field_2  varchar(100),
    temp_field_3  varchar(100),
    region_id     bigint,
    longitude     varchar(20),
    latitude      varchar(20),
    m_site_type   varchar(200),
    zone          varchar(20)
);

alter table o_site
    owner to postgres;

create table o_role
(
    role_id      serial
        constraint o_role_pk
            primary key,
    role_name    varchar(100)      not null,
    o_id         integer           not null,
    description  varchar(300),
    is_deleted   integer default 0 not null,
    created_by   integer           not null,
    created_time timestamp         not null,
    updated_by   integer,
    updated_time timestamp,
    is_editable  integer default 1 not null
);

alter table o_role
    owner to postgres;

create table o_role_module_actions
(
    role_module_action_id serial
        constraint o_role_module_actions_pk
            primary key,
    role_id               serial,
    module_code           varchar(100),
    permissions           json not null
);

alter table o_role_module_actions
    owner to postgres;

create table organisation
(
    o_id                       integer               not null
        constraint organisation_new_pkey
            primary key,
    o_name                     varchar(100)          not null,
    o_type_id                  integer               not null,
    address_line1              varchar(300),
    address_line2              varchar(300),
    city_id                    bigint,
    state_id                   bigint,
    country_id                 bigint,
    contact_no1                varchar(20),
    contact_no2                varchar(20),
    is_deleted                 integer     default 0 not null,
    is_active                  integer     default 1 not null,
    created_by                 bigint,
    created_time               timestamp,
    updated_by                 bigint,
    updated_time               timestamp,
    description                varchar(300),
    comments                   varchar(300),
    industry_type              bigint,
    o_code                     varchar(50),
    is_audit_remark_compulsary integer     default 1 not null,
    o_pic_id                   bigint,
    default_geo_time           varchar(45) default '0'::character varying,
    default_geo_radius         varchar(45) default '0'::character varying
);

alter table organisation
    owner to postgres;

create index ix_o_type_id
    on organisation (o_type_id);

create table o_relation
(
    o_relation_id serial
        primary key,
    parent_org_id bigint,
    child_org_id  bigint,
    is_deleted    integer default 0,
    is_active     integer default 1,
    created_by    bigint,
    created_time  timestamp,
    updated_by    bigint,
    updated_time  timestamp,
    o_type        integer default 3
);

alter table o_relation
    owner to postgres;

create index ix_child_org_id
    on o_relation (child_org_id);

create index ix_parent_org_id
    on o_relation (parent_org_id);

create table category_master
(
    cm_id          serial
        primary key,
    category_name  text,
    category_level integer,
    category_group integer,
    task_id        integer,
    column_name    varchar(100),
    stock_take_tree_view         bool
)

alter table category_master
    owner to postgres;

create table product_master
(
    product_id   serial
        constraint new_product_master_pk
            primary key,
    product_code varchar(200),
    link_code    varchar(200),
    c1           varchar(200),
    c2           varchar(200),
    c3           varchar(200),
    c4           varchar(200),
    c5           varchar(200),
    c6           varchar(200),
    c7           varchar(200),
    c8           varchar(200),
    c9           varchar(200),
    c10          varchar(200),
    c11          varchar(200),
    c12          varchar(200),
    c13          varchar(200),
    c14          varchar(200),
    c15          varchar(200),
    extra1       varchar(200),
    extra2       varchar(200),
    created_time timestamp,
    image_url    jsonb
);

alter table product_master
    owner to postgres;

create table users
(
    user_id               serial
        constraint new_users_pk
            primary key,
    e_id                  integer,
    is_admin              integer,
    is_super_admin        integer,
    last_login            timestamp,
    login_attempts        integer,
    force_change_password integer default 0,
    created_by            integer,
    updated_by            integer,
    username              varchar(100),
    password              text,
    created_time          timestamp,
    updated_time          timestamp,
    is_deleted            integer,
    is_active             integer,
    o_id                  integer,
    scope_id              integer,
    role_id               integer,
    email                 varchar(80),
    site_id               integer,
    imei                  text,
    fcm_token             text
);

alter table users
    owner to postgres;

create table m_scope_type
(
    scope_type_id    serial
        constraint m_scope_type_pk
            primary key,
    scope_level_name varchar(100),
    created_time     timestamp,
    is_deleted       integer
);

alter table m_scope_type
    owner to postgres;

create unique index m_scope_type_scope_type_id_uindex
    on m_scope_type (scope_type_id);

create table o_zone
(
    zone_id                  serial
        constraint o_zone_pk
            primary key,
    zone_name                varchar(100),
    panel_id                 integer,
    zone_group_id            integer,
    o_id                     integer,
    site_id                  integer,
    area_id                  integer,
    region_id                integer,
    zone_template_id         integer,
    action_plan_id           integer,
    is_active                integer,
    is_deleted               integer,
    created_by               integer,
    created_time             timestamp,
    updated_by               integer,
    updated_time             timestamp,
    description              text,
    comments                 text,
    status_id                integer,
    serial_number            varchar default 100,
    physical_status_id       integer,
    physical_number          integer,
    last_event_occurred_time timestamp,
    last_occurred_time       timestamp,
    mode                     integer,
    group_id                 integer,
    temp_field_1             text,
    temp_field_2             text,
    temp_field_3             text,
    last_occurred_event      varchar(100),
    is_inward_zone           integer,
    is_shop_floor            integer,
    zone_code                text
);

alter table o_zone
    owner to postgres;

create table o_site_zone
(
    sz_id          serial
        constraint p_site_zone
            primary key,
    zone_name      varchar(200),
    is_inward_zone integer,
    site_id        integer,
    zone_code      text,
    is_shop_floor  integer,
    o_id           integer,
    updated_time   timestamp,
    created_time   timestamp,
    updated_by     integer,
    is_deleted     integer,
    description    text,
    comments       text,
    audit_remark   text,
    temp_field_1   varchar(50),
    temp_field_2   varchar(50),
    temp_field_3   varchar(50)
);

alter table o_site_zone
    owner to postgres;

create table epc_status
(
    epc_id                  serial
        constraint epc_status_pk
            primary key,
    epc                     varchar(50),
    product_code            varchar(50),
    serial_number           bigint,
    status                  varchar(50),
    status_id               integer,
    site_id                 integer,
    sz_id                   integer,
    prev_site_id            integer,
    created_time            timestamp,
    updated_time            timestamp,
    last_scanned_dt         timestamp,
    last_scanned_rdr_id     integer,
    last_stock_take_scanned timestamp,
    prev_epc                varchar(50),
    stock_transfer_id       integer,
    additional_info         jsonb
);

alter table epc_status
    owner to postgres;

create table stock_transfer_processes
(
    process_id             serial
        constraint stock_transfer_processes_pk
            primary key,
    process_code           varchar(150),
    name                   varchar(150),
    other_info             jsonb,
    reference_no_name      varchar(150),
    integration_table_name varchar(150),
    inward_outward         varchar(150)
);

alter table stock_transfer_processes
    owner to postgres;

create table stock_transfer_info
(
    stock_transfer_id serial
        constraint stock_transfer_info_pk
            primary key,
    reference_no      varchar(50),
    reference_dt      timestamp,
    other_details     jsonb,
    site_id           integer,
    status            varchar(50),
    createdt          timestamp,
    updatedt          timestamp,
    inward_outward    varchar(50),
    process_id        integer
);

alter table stock_transfer_info
    owner to postgres;

create table stock_transfer_items
(
    stock_transfer_items_id serial
        constraint stock_transfer_items_pk
            primary key,
    stock_transfer_id       integer,
    reference_dt            timestamp,
    process_id              integer,
    reference_no            varchar(50),
    sub_reference_no        varchar(50),
    product_code            varchar(50),
    integration_qty         integer,
    site_id                 integer,
    from_site_id            integer,
    scanned_qty             integer,
    additional_info         jsonb,
    list_epc                jsonb,
    inward_outward          varchar(50),
    status                  varchar(50),
    create_dt               timestamp,
    update_dt               timestamp
);

alter table stock_transfer_items
    owner to postgres;

create table epc_inward
(
    stock_tf_epc_id         serial
        constraint epc_inward_pk
            primary key,
    scan_time               timestamp,
    epc                     varchar(50),
    product_code            varchar(50),
    serial_number           integer,
    device_id               integer,
    stock_transfer_id       integer,
    stock_transfer_items_id integer,
    site_id                 integer,
    from_site_id            integer,
    status                  integer,
    reference_no            varchar(50),
    sub_reference_no        varchar(50),
    user_id                 integer,
    tag_type                varchar(50),
    process_id              integer
);

alter table epc_inward
    owner to postgres;

create table epc_outward
(
    stock_tf_epc_id         serial
        constraint epc_outward_pk
            primary key,
    scan_time               timestamp,
    epc                     varchar(50),
    product_code            varchar(50),
    serial_number           integer,
    device_id               integer,
    stock_transfer_id       integer,
    stock_transfer_items_id integer,
    site_id                 integer,
    to_site_id              integer,
    reference_no            varchar(50),
    sub_reference_no        varchar,
    user_id                 integer,
    tag_type                varchar(50),
    process_id              integer
);

alter table epc_outward
    owner to postgres;

create table epc_transactions
(
    txn_id            serial
        constraint epc_transactions_pk
            primary key,
    epc               varchar(50),
    epc_id            integer,
    product_code      varchar(50),
    serial_number     integer,
    txn_time          timestamp,
    from_site_id      integer,
    to_site_id        integer,
    prev_status       varchar(50),
    to_status         varchar(50),
    stock_transfer_id integer,
    created_time      timestamp,
    device_id         integer,
    additional_info   varchar(50)
);

alter table epc_transactions
    owner to postgres;

create table stock_take_epcs
(
    stxn_id       serial
        constraint stock_take_epcs_pk
            primary key,
    epc           varchar(50),
    product_code  varchar(50),
    serial_number integer,
    scan_time     timestamp,
    site_id       integer,
    sz_id         integer,
    created_time  timestamp,
    device_id     integer,
    session_id    integer
);

alter table stock_take_epcs
    owner to postgres;

create table customer_stock
(
    stxn_id      serial
        constraint customer_stock_pk
            primary key,
    product_code varchar(50),
    stock_qty    integer,
    stock_date   timestamp,
    site_id      integer,
    created_time timestamp
);

alter table customer_stock
    owner to postgres;

create table "epc_detected_tx "
(
    detect_id         serial
        constraint "epc_detected_tx _pk"
            primary key,
    reader_id         integer,
    epc               varchar(50),
    product_code      varchar(50),
    serial_number     integer,
    detected_dt       timestamp,
    "application_id " varchar(50),
    site_id           integer,
    sz_id             integer
);

alter table "epc_detected_tx "
    owner to postgres;

create table stock_take_sessions
(
    session_id          serial
        constraint stock_take_sessions_pk
            primary key,
    name                varchar(50),
    site_id             integer,
    created_by          integer,
    created_time        timestamp,
    completed_time      timestamp,
    status              varchar,
    updated_time        timestamp,
    comment             text,
    schedule_id         integer,
    notification_status integer,
    data                text,
    percentage_complete varchar(50),
    session_name        varchar(100),
    session_start_time  timestamp
);

alter table stock_take_sessions
    owner to postgres;

create table session_count_integration
(
    s_id          serial
        constraint session_count_integration_pk
            primary key,
    total_count   integer,
    valid_count   integer,
    epc           varchar(100),
    product_code  varchar(100),
    epc_count     integer,
    barcode_count integer,
    session_id    integer
);

alter table session_count_integration
    owner to postgres;

create table o_readers
(
    reader_id            serial
        constraint readers_pk
            primary key,
    reader_code          varchar(50),
    reader_no            integer,
    application_id       integer,
    reader_name          varchar(50),
    sz_id                integer,
    site_id              integer,
    panel_id             integer,
    created_time         timestamp,
    updated_time         timestamp,
    last_scanned         timestamp,
    gps_location_details varchar(500),
    is_active            integer,
    is_deleted           integer,
    o_id                 integer
);

alter table o_readers
    owner to postgres;

create table o_panel
(
    panel_id                   serial
        constraint o_panel_pk
            primary key,
    panel_name                 varchar(200),
    panel_number               varchar(100),
    panel_code                 varchar(50),
    panel_type_id              integer,
    panel_type_group_code      varchar(100),
    panel_multi_device_support varchar(100),
    panel_hw_unique_code       varchar(100),
    ip_address                 varchar(100),
    local_ip_address           varchar(100),
    port                       varchar(10),
    is_deleted                 integer,
    created_time               timestamp,
    updated_time               timestamp,
    created_by                 integer,
    updated_by                 integer,
    o_id                       integer,
    site_id                    integer,
    sz_id                      integer,
    extra_info                 jsonb,
    mac_address                varchar(50),
    contact_number             varchar(20),
    serial_number              varchar(50),
    area_id                    integer,
    region_id                  integer,
    heart_beat_duration        integer,
    status_id                  integer,
    is_active                  integer,
    last_maintenance_date      timestamp,
    installation_date          timestamp,
    comments                   text,
    description                text,
    temp_field_1               text,
    temp_field_2               text,
    temp_field_3               text,
    register_token             varchar(50),
    is_registered              integer,
    register_time              timestamp,
    registered_users           integer
);

alter table o_panel
    owner to postgres;

create table o_reader_application
(
    application_id  serial
        constraint o_reader_application_pk
            primary key,
    reader_app_code varchar(50),
    reader_app_name varchar(50),
    is_deleted      integer,
    created_time    timestamp
);

alter table o_reader_application
    owner to postgres;

create table m_panel_type
(
    panel_type_id         serial
        constraint m_panel_type_pk
            primary key,
    panel_type_group_code varchar(50),
    panel_type_name       varchar(50),
    is_deleted            integer,
    created_time          timestamp
);

alter table m_panel_type
    owner to postgres;

create table o_user_panel
(
    o_u_p_map_id serial
        constraint o_user_panel_pk
            primary key,
    user_id      integer,
    panel_id     integer,
    site_id      integer,
    sz_id        integer,
    o_id         integer,
    region_id    integer,
    area_id      integer,
    is_deleted   integer,
    created_by   integer,
    updated_by   integer,
    created_time timestamp,
    updated_time timestamp
);

alter table o_user_panel
    owner to postgres;

create table app_update
(
    m_id         serial
        constraint mobile_update_pk
            primary key,
    version_name varchar(500),
    version_code integer,
    release_date timestamp,
    build_date   timestamp,
    change_log   text,
    url          varchar(500),
    file_name    varchar(500),
    app_type     varchar(500),
    is_prod      boolean,
    created      timestamp,
    updated      timestamp,
    git_hash_num text,
    app_id       varchar(500),
    is_enable    boolean default true
);

alter table app_update
    owner to postgres;

create table app_settings
(
    setting_id   serial
        primary key,
    setting_name varchar(200),
    group_name   varchar(200),
    value        varchar(200),
    updated_time timestamp,
    created_time timestamp
);

alter table app_settings
    owner to postgres;

create table automail_integration
(
    aid     serial
        constraint automail_integration_pk
            primary key,
    uid     integer,
    "order" varchar(150),
    item    varchar(150),
    stock   varchar(150)
);

alter table automail_integration
    owner to postgres;

create table encode_session
(
    e_session_id serial
        constraint encode_session_pk
            primary key,
    session_type varchar(50),
    session_name varchar(50),
    ref_number   varchar(50),
    user_id      integer,
    site_id      integer,
    created_time timestamp,
    updated_time timestamp,
    status       varchar(50)
);

alter table encode_session
    owner to postgres;

create table serial_number
(
    serial_id     serial
        constraint serial_number_pk
            primary key,
    serial_number integer,
    description   varchar(100),
    updated_time  timestamp,
    created_time  timestamp,
    barcode       varchar(100)
);

alter table serial_number
    owner to postgres;

create table encoding
(
    encode_id              serial
        constraint encoding_pk
            primary key,
    epc                    varchar(100),
    prev_epc               varchar(100),
    product_code           varchar(100),
    pre_product_code       varchar(100),
    serial_number          varchar(100),
    previous_serial_number integer,
    status                 varchar(30),
    ref_number             varchar(100),
    user_id                integer,
    site_id                integer,
    panel_id               integer,
    error_type             varchar(30),
    created_time           timestamp,
    read_power             varchar(30),
    write_power            varchar(30),
    time_taken             timestamp
);

alter table encoding
    owner to postgres;

create table encode_items
(
    e_item_id    serial
        constraint encode_items_pk
            primary key,
    session_id   integer,
    product_code varchar(100),
    qty          integer,
    created_time timestamp
);

alter table encode_items
    owner to postgres;

