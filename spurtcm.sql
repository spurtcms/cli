PGDMP      !                |         	   spurt_cms    14.10     16.0 (Ubuntu 16.0-1.pgdg20.04+1) a   �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    17039 	   spurt_cms    DATABASE     u   CREATE DATABASE spurt_cms WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';
    DROP DATABASE spurt_cms;
                postgres    false                        2615    2200    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                postgres    false            �           0    0    SCHEMA public    ACL     Q   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   postgres    false    5            �           1247    17971    enum_access_type    TYPE     R   CREATE TYPE public.enum_access_type AS ENUM (
    'member-group',
    'member'
);
 #   DROP TYPE public.enum_access_type;
       public          postgres    false    5            �           1247    17950    enum_page_access    TYPE     M   CREATE TYPE public.enum_page_access AS ENUM (
    'public',
    'private'
);
 #   DROP TYPE public.enum_page_access;
       public          postgres    false    5            	           1247    25453    enum_page_note_type    TYPE     R   CREATE TYPE public.enum_page_note_type AS ENUM (
    'notes',
    'highlights'
);
 &   DROP TYPE public.enum_page_note_type;
       public          postgres    false    5            �           1247    17942    enum_page_status    TYPE     [   CREATE TYPE public.enum_page_status AS ENUM (
    'draft',
    'publish',
    'deleted'
);
 #   DROP TYPE public.enum_page_status;
       public          postgres    false    5            �           1247    17663 	   lang_code    TYPE     i   CREATE TYPE public.lang_code AS (
	en character varying,
	fr character varying,
	sp character varying
);
    DROP TYPE public.lang_code;
       public          postgres    false    5                       1259    18534 
   migrations    TABLE     �   CREATE TABLE public.migrations (
    id integer NOT NULL,
    "timestamp" bigint NOT NULL,
    name character varying NOT NULL
);
    DROP TABLE public.migrations;
       public         heap    postgres    false    5                       1259    18533    migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.migrations_id_seq;
       public          postgres    false    281    5            �           0    0    migrations_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;
          public          postgres    false    280                       1259    18506    tbl_access_control    TABLE     �  CREATE TABLE public.tbl_access_control (
    id integer NOT NULL,
    access_control_name character varying(255) DEFAULT NULL::character varying,
    access_control_slug character varying(255) DEFAULT NULL::character varying,
    created_on timestamp without time zone NOT NULL,
    created_by integer NOT NULL,
    modified_on timestamp without time zone,
    modified_by integer,
    is_deleted integer DEFAULT 0,
    deleted_on timestamp without time zone,
    deleted_by integer
);
 &   DROP TABLE public.tbl_access_control;
       public         heap    postgres    false    5                       1259    18505    tbl_access_control_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tbl_access_control_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.tbl_access_control_id_seq;
       public          postgres    false    5    277            �           0    0    tbl_access_control_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.tbl_access_control_id_seq OWNED BY public.tbl_access_control.id;
          public          postgres    false    276                       1259    18520    tbl_access_control_pages    TABLE     �  CREATE TABLE public.tbl_access_control_pages (
    id integer NOT NULL,
    access_control_user_group_id integer NOT NULL,
    spaces_id integer,
    page_group_id integer,
    page_id integer,
    created_on timestamp without time zone NOT NULL,
    created_by integer NOT NULL,
    modified_on timestamp without time zone,
    modified_by integer,
    is_deleted integer DEFAULT 0,
    deleted_on timestamp without time zone,
    deleted_by integer,
    channel_id integer,
    entry_id integer
);
 ,   DROP TABLE public.tbl_access_control_pages;
       public         heap    postgres    false    5                       1259    18519    tbl_access_control_pages_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tbl_access_control_pages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.tbl_access_control_pages_id_seq;
       public          postgres    false    279    5            �           0    0    tbl_access_control_pages_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.tbl_access_control_pages_id_seq OWNED BY public.tbl_access_control_pages.id;
          public          postgres    false    278                       1259    18498    tbl_access_control_user_group    TABLE     �  CREATE TABLE public.tbl_access_control_user_group (
    id integer NOT NULL,
    access_control_id integer NOT NULL,
    member_group_id integer NOT NULL,
    created_on timestamp without time zone NOT NULL,
    created_by integer NOT NULL,
    modified_on timestamp without time zone,
    modified_by integer,
    is_deleted integer DEFAULT 0,
    deleted_on timestamp without time zone,
    deleted_by integer
);
 1   DROP TABLE public.tbl_access_control_user_group;
       public         heap    postgres    false    5                       1259    18497 $   tbl_access_control_user_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tbl_access_control_user_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.tbl_access_control_user_group_id_seq;
       public          postgres    false    5    275            �           0    0 $   tbl_access_control_user_group_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.tbl_access_control_user_group_id_seq OWNED BY public.tbl_access_control_user_group.id;
          public          postgres    false    274            �            1259    17040    tbl_categories    TABLE     <  CREATE TABLE public.tbl_categories (
    id integer NOT NULL,
    category_name character varying(255) DEFAULT NULL::character varying,
    category_slug character varying(255) DEFAULT NULL::character varying,
    created_on timestamp without time zone NOT NULL,
    created_by integer NOT NULL,
    modified_on timestamp without time zone,
    modified_by integer,
    is_deleted integer DEFAULT 0,
    deleted_on timestamp without time zone,
    deleted_by integer,
    parent_id integer DEFAULT 0,
    description character varying,
    image_path character varying
);
 "   DROP TABLE public.tbl_categories;
       public         heap    postgres    false    5            �            1259    17048    tbl_categories_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tbl_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.tbl_categories_id_seq;
       public          postgres    false    5    209            �           0    0    tbl_categories_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.tbl_categories_id_seq OWNED BY public.tbl_categories.id;
          public          postgres    false    210            �            1259    17491    tbl_channel_category    TABLE     �   CREATE TABLE public.tbl_channel_category (
    id integer NOT NULL,
    channel_id integer,
    category_id character varying,
    created_at integer,
    created_on timestamp without time zone
);
 (   DROP TABLE public.tbl_channel_category;
       public         heap    postgres    false    5            �            1259    17490    tbl_channel_category_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tbl_channel_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.tbl_channel_category_id_seq;
       public          postgres    false    5    248            �           0    0    tbl_channel_category_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.tbl_channel_category_id_seq OWNED BY public.tbl_channel_category.id;
          public          postgres    false    247            �            1259    17049    tbl_channel_entries    TABLE     !  CREATE TABLE public.tbl_channel_entries (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    description text,
    user_id integer NOT NULL,
    channel_id integer NOT NULL,
    status integer NOT NULL,
    is_active integer DEFAULT 1 NOT NULL,
    is_deleted integer DEFAULT 0 NOT NULL,
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer,
    deleted_on timestamp without time zone,
    deleted_by integer,
    slug character varying,
    cover_image character varying,
    thumbnail_image character varying,
    meta_title character varying,
    meta_description character varying,
    keyword character varying,
    categories_id character varying,
    related_articles character varying
);
 '   DROP TABLE public.tbl_channel_entries;
       public         heap    postgres    false    5            �            1259    17056    tbl_channel_entries_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tbl_channel_entries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.tbl_channel_entries_id_seq;
       public          postgres    false    211    5            �           0    0    tbl_channel_entries_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.tbl_channel_entries_id_seq OWNED BY public.tbl_channel_entries.id;
          public          postgres    false    212            �            1259    17057    tbl_channel_entry_fields    TABLE     �  CREATE TABLE public.tbl_channel_entry_fields (
    id integer NOT NULL,
    field_name character varying(255),
    field_value character varying(255),
    channel_entry_id integer NOT NULL,
    field_id integer NOT NULL,
    created_on timestamp without time zone NOT NULL,
    created_by integer NOT NULL,
    modified_on timestamp without time zone,
    modified_by integer,
    is_deleted integer,
    deleted_by integer,
    deleted_on timestamp without time zone
);
 ,   DROP TABLE public.tbl_channel_entry_fields;
       public         heap    postgres    false    5            �            1259    17062    tbl_channel_entry_fields_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tbl_channel_entry_fields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.tbl_channel_entry_fields_id_seq;
       public          postgres    false    213    5            �           0    0    tbl_channel_entry_fields_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.tbl_channel_entry_fields_id_seq OWNED BY public.tbl_channel_entry_fields.id;
          public          postgres    false    214            �            1259    17063    tbl_channel_entry_media    TABLE     �  CREATE TABLE public.tbl_channel_entry_media (
    id integer NOT NULL,
    media_type_id integer NOT NULL,
    channel_entry_id integer NOT NULL,
    file_name character varying(255),
    file_path text,
    created_by integer,
    created_on character varying(45),
    modified_on timestamp without time zone,
    modified_by integer,
    is_deleted integer DEFAULT 0,
    deleted_on timestamp without time zone,
    deleted_by integer
);
 +   DROP TABLE public.tbl_channel_entry_media;
       public         heap    postgres    false    5            �            1259    17069    tbl_channels    TABLE     �  CREATE TABLE public.tbl_channels (
    id integer NOT NULL,
    channel_name character varying(255),
    slug_name character varying(255),
    field_group_id integer NOT NULL,
    is_active integer DEFAULT 1 NOT NULL,
    is_deleted integer DEFAULT 0 NOT NULL,
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer,
    channel_description text
);
     DROP TABLE public.tbl_channels;
       public         heap    postgres    false    5            �            1259    17076    tbl_channels_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tbl_channels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;
 *   DROP SEQUENCE public.tbl_channels_id_seq;
       public          postgres    false    5    216            �           0    0    tbl_channels_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.tbl_channels_id_seq OWNED BY public.tbl_channels.id;
          public          postgres    false    217                       1259    19803    tbl_email_template    TABLE     �  CREATE TABLE public.tbl_email_template (
    id integer NOT NULL,
    template_name character varying,
    template_slug character varying,
    template_subject character varying,
    template_message text,
    created_by integer,
    created_on timestamp without time zone,
    modified_by integer,
    modified_on timestamp without time zone,
    deleted_by integer,
    deleted_on timestamp without time zone,
    is_deleted integer,
    is_active integer
);
 &   DROP TABLE public.tbl_email_template;
       public         heap    postgres    false    5                       1259    19802    tbl_email_template_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tbl_email_template_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.tbl_email_template_id_seq;
       public          postgres    false    284    5            �           0    0    tbl_email_template_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.tbl_email_template_id_seq OWNED BY public.tbl_email_template.id;
          public          postgres    false    283            �            1259    17077    tbl_field_groups    TABLE     k  CREATE TABLE public.tbl_field_groups (
    id integer NOT NULL,
    group_name character varying(255),
    created_on timestamp without time zone NOT NULL,
    created_by integer NOT NULL,
    modified_on timestamp without time zone,
    modified_by integer,
    is_deleted integer DEFAULT 0,
    deleted_on timestamp without time zone,
    deleted_by integer
);
 $   DROP TABLE public.tbl_field_groups;
       public         heap    postgres    false    5            �            1259    17081    tbl_field_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tbl_field_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.tbl_field_groups_id_seq;
       public          postgres    false    218    5            �           0    0    tbl_field_groups_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.tbl_field_groups_id_seq OWNED BY public.tbl_field_groups.id;
          public          postgres    false    219            �            1259    17082    tbl_field_options    TABLE     �  CREATE TABLE public.tbl_field_options (
    id integer NOT NULL,
    option_name character varying(255) NOT NULL,
    option_value character varying(255) NOT NULL,
    field_id integer NOT NULL,
    created_on timestamp without time zone NOT NULL,
    created_by integer NOT NULL,
    modified_on timestamp without time zone,
    modified_by integer,
    is_deleted integer DEFAULT 0,
    deleted_on timestamp without time zone,
    deleted_by integer
);
 %   DROP TABLE public.tbl_field_options;
       public         heap    postgres    false    5            �            1259    17088    tbl_field_options_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tbl_field_options_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.tbl_field_options_id_seq;
       public          postgres    false    5    220            �           0    0    tbl_field_options_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.tbl_field_options_id_seq OWNED BY public.tbl_field_options.id;
          public          postgres    false    221            �            1259    17089    tbl_field_types    TABLE     ~  CREATE TABLE public.tbl_field_types (
    id integer NOT NULL,
    type_name character varying(255) NOT NULL,
    type_slug character varying(255) NOT NULL,
    is_active integer DEFAULT 1,
    is_deleted integer DEFAULT 0,
    created_by integer NOT NULL,
    created_on timestamp without time zone NOT NULL,
    modified_by integer,
    modified_on timestamp without time zone
);
 #   DROP TABLE public.tbl_field_types;
       public         heap    postgres    false    5            �            1259    17096    tbl_field_types_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tbl_field_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.tbl_field_types_id_seq;
       public          postgres    false    5    222            �           0    0    tbl_field_types_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.tbl_field_types_id_seq OWNED BY public.tbl_field_types.id;
          public          postgres    false    223            �            1259    17097 
   tbl_fields    TABLE     �  CREATE TABLE public.tbl_fields (
    id integer NOT NULL,
    field_name character varying(45),
    field_type_id integer NOT NULL,
    mandatory_field integer DEFAULT 0,
    option_exist integer DEFAULT 0,
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer,
    is_deleted integer DEFAULT 0,
    deleted_on timestamp without time zone,
    deleted_by integer,
    field_desc character varying,
    order_index integer,
    initial_value character varying,
    placeholder text,
    image_path character varying,
    url character varying,
    datetime_format character varying,
    time_format character varying,
    section_parent_id integer,
    character_allowed integer
);
    DROP TABLE public.tbl_fields;
       public         heap    postgres    false    5            �            1259    17105    tbl_fields_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tbl_fields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.tbl_fields_id_seq;
       public          postgres    false    224    5            �           0    0    tbl_fields_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.tbl_fields_id_seq OWNED BY public.tbl_fields.id;
          public          postgres    false    225            �            1259    17106    tbl_group_fields    TABLE     �   CREATE TABLE public.tbl_group_fields (
    id integer NOT NULL,
    channel_id integer NOT NULL,
    field_id integer NOT NULL
);
 $   DROP TABLE public.tbl_group_fields;
       public         heap    postgres    false    5            �            1259    17109    tbl_group_fields_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tbl_group_fields_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;
 .   DROP SEQUENCE public.tbl_group_fields_id_seq;
       public          postgres    false    5    226            �           0    0    tbl_group_fields_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.tbl_group_fields_id_seq OWNED BY public.tbl_group_fields.id;
          public          postgres    false    227                       1259    18465    tbl_language    TABLE     �  CREATE TABLE public.tbl_language (
    id integer NOT NULL,
    language_name character varying(255),
    language_code character varying(3),
    image_path character varying,
    json_path character varying,
    is_status integer,
    is_default integer,
    created_by integer,
    created_on timestamp without time zone,
    modified_on timestamp without time zone,
    modified_by integer,
    is_deleted integer,
    deleted_on timestamp without time zone,
    deleted_by integer
);
     DROP TABLE public.tbl_language;
       public         heap    postgres    false    5                       1259    18464    tbl_language_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tbl_language_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.tbl_language_id_seq;
       public          postgres    false    5    273            �           0    0    tbl_language_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.tbl_language_id_seq OWNED BY public.tbl_language.id;
          public          postgres    false    272            �            1259    17110    tbl_media_type    TABLE     �   CREATE TABLE public.tbl_media_type (
    id integer NOT NULL,
    type character varying(255),
    slug character varying(255)
);
 "   DROP TABLE public.tbl_media_type;
       public         heap    postgres    false    5            �            1259    17115    tbl_member_groups    TABLE     �  CREATE TABLE public.tbl_member_groups (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    is_active integer DEFAULT 1 NOT NULL,
    is_deleted integer DEFAULT 0 NOT NULL,
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer,
    description text
);
 %   DROP TABLE public.tbl_member_groups;
       public         heap    postgres    false    5            �            1259    17122    tbl_member_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tbl_member_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.tbl_member_group_id_seq;
       public          postgres    false    5    229            �           0    0    tbl_member_group_id_seq    SEQUENCE OWNED BY     T   ALTER SEQUENCE public.tbl_member_group_id_seq OWNED BY public.tbl_member_groups.id;
          public          postgres    false    230                        1259    25458    tbl_member_notes_highlights    TABLE     �  CREATE TABLE public.tbl_member_notes_highlights (
    id integer NOT NULL,
    member_id integer,
    page_id integer,
    notes_highlights_content text,
    notes_highlights_type public.enum_page_note_type,
    created_by integer,
    created_on timestamp without time zone,
    modified_by integer,
    modified_on timestamp without time zone,
    deleted_by integer,
    deleted_on timestamp without time zone,
    is_deleted integer
);
 /   DROP TABLE public.tbl_member_notes_highlights;
       public         heap    postgres    false    5    1033                       1259    25457 "   tbl_member_notes_highlights_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tbl_member_notes_highlights_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.tbl_member_notes_highlights_id_seq;
       public          postgres    false    5    288            �           0    0 "   tbl_member_notes_highlights_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.tbl_member_notes_highlights_id_seq OWNED BY public.tbl_member_notes_highlights.id;
          public          postgres    false    287            �            1259    17123    tbl_members    TABLE     +  CREATE TABLE public.tbl_members (
    id integer NOT NULL,
    uuid character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    email character varying(255) NOT NULL,
    username character varying(255),
    password character varying(255),
    mobile_no character varying(255),
    is_active integer DEFAULT 1,
    member_group_id integer NOT NULL,
    profile_image character varying(255),
    profile_image_path text,
    created_on timestamp without time zone NOT NULL,
    created_by integer NOT NULL,
    modified_on timestamp without time zone,
    modified_by integer,
    last_login integer,
    is_deleted integer DEFAULT 0,
    deleted_on timestamp without time zone,
    deleted_by integer,
    otp integer,
    otp_expiry timestamp without time zone
);
    DROP TABLE public.tbl_members;
       public         heap    postgres    false    5            �            1259    17130    tbl_members_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tbl_members_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.tbl_members_id_seq;
       public          postgres    false    5    231            �           0    0    tbl_members_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.tbl_members_id_seq OWNED BY public.tbl_members.id;
          public          postgres    false    232            �            1259    17131    tbl_module_permissions    TABLE        CREATE TABLE public.tbl_module_permissions (
    id integer NOT NULL,
    route_name character varying(255) NOT NULL,
    display_name character varying(255) NOT NULL,
    description text,
    module_id integer NOT NULL,
    created_by integer NOT NULL,
    created_on timestamp without time zone NOT NULL,
    modified_by integer,
    modified_on timestamp without time zone,
    full_access_permission integer DEFAULT 0,
    parent_id integer,
    assign_permission integer,
    breadcrumb_name character varying,
    order_index integer
);
 *   DROP TABLE public.tbl_module_permissions;
       public         heap    postgres    false    5            �            1259    17137    tbl_module_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tbl_module_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.tbl_module_permissions_id_seq;
       public          postgres    false    233    5            �           0    0    tbl_module_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.tbl_module_permissions_id_seq OWNED BY public.tbl_module_permissions.id;
          public          postgres    false    234            �            1259    17138    tbl_modules    TABLE     �  CREATE TABLE public.tbl_modules (
    id integer NOT NULL,
    module_name character varying(255) NOT NULL,
    is_active integer DEFAULT 1,
    created_by integer,
    created_on timestamp without time zone,
    default_module integer DEFAULT 0,
    parent_id integer NOT NULL,
    assign_permission integer,
    icon_path character varying,
    description character varying,
    order_index integer
);
    DROP TABLE public.tbl_modules;
       public         heap    postgres    false    5            �            1259    17143    tbl_modules_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tbl_modules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;
 )   DROP SEQUENCE public.tbl_modules_id_seq;
       public          postgres    false    235    5            �           0    0    tbl_modules_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.tbl_modules_id_seq OWNED BY public.tbl_modules.id;
          public          postgres    false    236                       1259    18090    tbl_page    TABLE     i  CREATE TABLE public.tbl_page (
    id integer NOT NULL,
    spaces_id integer,
    page_group_id integer,
    parent_id integer,
    created_by integer,
    created_on timestamp without time zone,
    modified_by integer,
    modified_on timestamp without time zone,
    deleted_by integer,
    deleted_on timestamp without time zone,
    is_deleted integer
);
    DROP TABLE public.tbl_page;
       public         heap    postgres    false    5                       1259    18293    tbl_page_aliases    TABLE     �  CREATE TABLE public.tbl_page_aliases (
    id integer NOT NULL,
    page_id integer,
    language_id integer,
    page_title character varying(255) DEFAULT NULL::character varying,
    page_slug character varying(255) DEFAULT NULL::character varying,
    page_description character varying,
    published_on timestamp without time zone,
    author character varying(255) DEFAULT NULL::character varying,
    excerpt character varying,
    featured_images character varying,
    access public.enum_page_access,
    meta_details json,
    status public.enum_page_status,
    allow_comments boolean,
    last_revision_no integer,
    last_revision_date timestamp without time zone,
    created_on timestamp without time zone NOT NULL,
    created_by integer NOT NULL,
    modified_on timestamp without time zone,
    modified_by integer,
    deleted_on timestamp without time zone,
    deleted_by integer,
    is_deleted integer,
    order_index integer,
    page_suborder integer
);
 $   DROP TABLE public.tbl_page_aliases;
       public         heap    postgres    false    970    5    973                       1259    18292    tbl_page_aliases_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tbl_page_aliases_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.tbl_page_aliases_id_seq;
       public          postgres    false    269    5            �           0    0    tbl_page_aliases_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.tbl_page_aliases_id_seq OWNED BY public.tbl_page_aliases.id;
          public          postgres    false    268                       1259    18307    tbl_page_aliases_log    TABLE     ;  CREATE TABLE public.tbl_page_aliases_log (
    id integer NOT NULL,
    page_id integer,
    language_id integer,
    page_title character varying(255) DEFAULT NULL::character varying,
    page_slug character varying(255) DEFAULT NULL::character varying,
    page_description character varying,
    published_on timestamp without time zone,
    author character varying(255) DEFAULT NULL::character varying,
    excerpt character varying,
    featured_images character varying,
    access public.enum_page_access,
    meta_details json,
    status public.enum_page_status,
    allow_comments boolean,
    created_on timestamp without time zone NOT NULL,
    created_by integer NOT NULL,
    modified_on timestamp without time zone,
    modified_by integer,
    deleted_on timestamp without time zone,
    deleted_by integer
);
 (   DROP TABLE public.tbl_page_aliases_log;
       public         heap    postgres    false    970    5    973                       1259    18306    tbl_page_aliases_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tbl_page_aliases_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.tbl_page_aliases_log_id_seq;
       public          postgres    false    5    271            �           0    0    tbl_page_aliases_log_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.tbl_page_aliases_log_id_seq OWNED BY public.tbl_page_aliases_log.id;
          public          postgres    false    270                       1259    18089    tbl_page_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tbl_page_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.tbl_page_id_seq;
       public          postgres    false    259    5            �           0    0    tbl_page_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.tbl_page_id_seq OWNED BY public.tbl_page.id;
          public          postgres    false    258                       1259    18122    tbl_pages_access_coutrol    TABLE     �   CREATE TABLE public.tbl_pages_access_coutrol (
    id integer NOT NULL,
    page_id integer,
    access_type public.enum_access_type,
    access_item_id integer[]
);
 ,   DROP TABLE public.tbl_pages_access_coutrol;
       public         heap    postgres    false    5    976                       1259    18121    tbl_pages_access_coutrol_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tbl_pages_access_coutrol_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.tbl_pages_access_coutrol_id_seq;
       public          postgres    false    5    261            �           0    0    tbl_pages_access_coutrol_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.tbl_pages_access_coutrol_id_seq OWNED BY public.tbl_pages_access_coutrol.id;
          public          postgres    false    260            �            1259    18051    tbl_pages_categories    TABLE     _  CREATE TABLE public.tbl_pages_categories (
    id integer NOT NULL,
    created_on timestamp without time zone NOT NULL,
    created_by integer NOT NULL,
    modified_on timestamp without time zone,
    modified_by integer,
    is_deleted integer DEFAULT 0,
    deleted_on timestamp without time zone,
    deleted_by integer,
    parent_id integer
);
 (   DROP TABLE public.tbl_pages_categories;
       public         heap    postgres    false    5                       1259    18210    tbl_pages_categories_aliases    TABLE     _  CREATE TABLE public.tbl_pages_categories_aliases (
    id integer NOT NULL,
    page_category_id integer DEFAULT 0,
    language_id integer,
    category_name character varying(255) DEFAULT NULL::character varying,
    category_slug character varying(255) DEFAULT NULL::character varying,
    description character varying,
    created_on timestamp without time zone NOT NULL,
    created_by integer NOT NULL,
    modified_on timestamp without time zone,
    modified_by integer,
    is_deleted integer DEFAULT 0,
    deleted_on timestamp without time zone,
    deleted_by integer,
    parent_id integer
);
 0   DROP TABLE public.tbl_pages_categories_aliases;
       public         heap    postgres    false    5                       1259    18209 #   tbl_pages_categories_aliases_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tbl_pages_categories_aliases_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.tbl_pages_categories_aliases_id_seq;
       public          postgres    false    5    263            �           0    0 #   tbl_pages_categories_aliases_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.tbl_pages_categories_aliases_id_seq OWNED BY public.tbl_pages_categories_aliases.id;
          public          postgres    false    262            �            1259    18050    tbl_pages_categories_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tbl_pages_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.tbl_pages_categories_id_seq;
       public          postgres    false    253    5            �           0    0    tbl_pages_categories_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.tbl_pages_categories_id_seq OWNED BY public.tbl_pages_categories.id;
          public          postgres    false    252                       1259    18077    tbl_pages_group    TABLE     Z  CREATE TABLE public.tbl_pages_group (
    id integer NOT NULL,
    spaces_id integer,
    created_on timestamp without time zone NOT NULL,
    created_by integer NOT NULL,
    modified_on timestamp without time zone,
    modified_by integer,
    is_deleted integer DEFAULT 0,
    deleted_on timestamp without time zone,
    deleted_by integer
);
 #   DROP TABLE public.tbl_pages_group;
       public         heap    postgres    false    5                       1259    18239    tbl_pages_group_aliases    TABLE     O  CREATE TABLE public.tbl_pages_group_aliases (
    id integer NOT NULL,
    page_group_id integer,
    language_id integer,
    group_name character varying(255) DEFAULT NULL::character varying,
    group_slug character varying(255) DEFAULT NULL::character varying,
    group_description character varying,
    created_on timestamp without time zone NOT NULL,
    created_by integer NOT NULL,
    modified_on timestamp without time zone,
    modified_by integer,
    is_deleted integer DEFAULT 0,
    deleted_on timestamp without time zone,
    deleted_by integer,
    order_index integer
);
 +   DROP TABLE public.tbl_pages_group_aliases;
       public         heap    postgres    false    5            
           1259    18238    tbl_pages_group_aliases_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tbl_pages_group_aliases_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.tbl_pages_group_aliases_id_seq;
       public          postgres    false    5    267            �           0    0    tbl_pages_group_aliases_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.tbl_pages_group_aliases_id_seq OWNED BY public.tbl_pages_group_aliases.id;
          public          postgres    false    266                        1259    18076    tbl_pages_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tbl_pages_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.tbl_pages_group_id_seq;
       public          postgres    false    257    5            �           0    0    tbl_pages_group_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.tbl_pages_group_id_seq OWNED BY public.tbl_pages_group.id;
          public          postgres    false    256            �            1259    17144    tbl_permitted_users    TABLE     �   CREATE TABLE public.tbl_permitted_users (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permitted_user_id integer NOT NULL,
    access_type integer,
    created_by integer,
    created_on timestamp without time zone
);
 '   DROP TABLE public.tbl_permitted_users;
       public         heap    postgres    false    5            �            1259    17147    tbl_permitted_users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tbl_permitted_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.tbl_permitted_users_id_seq;
       public          postgres    false    5    237            �           0    0    tbl_permitted_users_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.tbl_permitted_users_id_seq OWNED BY public.tbl_permitted_users.id;
          public          postgres    false    238            �            1259    17148    tbl_role_permissions    TABLE     �   CREATE TABLE public.tbl_role_permissions (
    id integer NOT NULL,
    role_id integer NOT NULL,
    permission_id integer NOT NULL,
    created_by integer NOT NULL,
    created_on timestamp without time zone
);
 (   DROP TABLE public.tbl_role_permissions;
       public         heap    postgres    false    5            �            1259    17151    tbl_role_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tbl_role_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.tbl_role_permissions_id_seq;
       public          postgres    false    239    5            �           0    0    tbl_role_permissions_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.tbl_role_permissions_id_seq OWNED BY public.tbl_role_permissions.id;
          public          postgres    false    240            �            1259    17152    tbl_role_user    TABLE       CREATE TABLE public.tbl_role_user (
    id integer NOT NULL,
    role_id integer NOT NULL,
    user_id integer NOT NULL,
    created_by integer,
    modified_by integer,
    modified_on timestamp without time zone,
    created_on timestamp without time zone
);
 !   DROP TABLE public.tbl_role_user;
       public         heap    postgres    false    5            �            1259    17155    tbl_role_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tbl_role_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.tbl_role_user_id_seq;
       public          postgres    false    241    5            �           0    0    tbl_role_user_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.tbl_role_user_id_seq OWNED BY public.tbl_role_user.id;
          public          postgres    false    242            �            1259    17156 	   tbl_roles    TABLE     �  CREATE TABLE public.tbl_roles (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    slug character varying(255) NOT NULL,
    is_active integer DEFAULT 1 NOT NULL,
    is_deleted integer DEFAULT 0 NOT NULL,
    created_on timestamp without time zone,
    created_by integer,
    modified_on timestamp without time zone,
    modified_by integer
);
    DROP TABLE public.tbl_roles;
       public         heap    postgres    false    5            �            1259    17163    tbl_roles_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tbl_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.tbl_roles_id_seq;
       public          postgres    false    243    5            �           0    0    tbl_roles_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.tbl_roles_id_seq OWNED BY public.tbl_roles.id;
          public          postgres    false    244            �            1259    18064 
   tbl_spaces    TABLE     \  CREATE TABLE public.tbl_spaces (
    id integer NOT NULL,
    page_category_id integer,
    created_on timestamp without time zone NOT NULL,
    created_by integer NOT NULL,
    modified_on timestamp without time zone,
    modified_by integer,
    is_deleted integer DEFAULT 0,
    deleted_on timestamp without time zone,
    deleted_by integer
);
    DROP TABLE public.tbl_spaces;
       public         heap    postgres    false    5            	           1259    18225    tbl_spaces_aliases    TABLE     R  CREATE TABLE public.tbl_spaces_aliases (
    id integer NOT NULL,
    spaces_id integer,
    language_id integer,
    spaces_name character varying(255) DEFAULT NULL::character varying,
    spaces_slug character varying(255) DEFAULT NULL::character varying,
    spaces_description character varying,
    created_on timestamp without time zone NOT NULL,
    created_by integer NOT NULL,
    modified_on timestamp without time zone,
    modified_by integer,
    is_deleted integer DEFAULT 0,
    deleted_on timestamp without time zone,
    deleted_by integer,
    image_path character varying
);
 &   DROP TABLE public.tbl_spaces_aliases;
       public         heap    postgres    false    5                       1259    18224    tbl_spaces_aliases_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tbl_spaces_aliases_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.tbl_spaces_aliases_id_seq;
       public          postgres    false    265    5            �           0    0    tbl_spaces_aliases_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.tbl_spaces_aliases_id_seq OWNED BY public.tbl_spaces_aliases.id;
          public          postgres    false    264            �            1259    18063    tbl_spaces_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tbl_spaces_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.tbl_spaces_id_seq;
       public          postgres    false    255    5            �           0    0    tbl_spaces_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.tbl_spaces_id_seq OWNED BY public.tbl_spaces.id;
          public          postgres    false    254            �            1259    17665    tbl_trans_pages    TABLE     �  CREATE TABLE public.tbl_trans_pages (
    id integer NOT NULL,
    page_id integer,
    lang_code public.lang_code,
    page_title character varying,
    page_description character varying,
    page_extra character varying,
    created_at timestamp without time zone,
    created_by integer,
    modified_at timestamp without time zone,
    modified_by integer,
    deleted_at timestamp without time zone,
    deleted_by integer,
    is_deleted integer
);
 #   DROP TABLE public.tbl_trans_pages;
       public         heap    postgres    false    5    964            �            1259    17664    tbl_trans_pages_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tbl_trans_pages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.tbl_trans_pages_id_seq;
       public          postgres    false    5    251            �           0    0    tbl_trans_pages_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.tbl_trans_pages_id_seq OWNED BY public.tbl_trans_pages.id;
          public          postgres    false    250                       1259    19812    tbl_user_personalizes    TABLE     o  CREATE TABLE public.tbl_user_personalizes (
    id integer NOT NULL,
    user_id integer,
    menu_background_color character varying,
    font_color character varying,
    icon_color character varying,
    logo_path character varying,
    created_on timestamp without time zone,
    modified_on timestamp without time zone,
    expand_logo_path character varying
);
 )   DROP TABLE public.tbl_user_personalizes;
       public         heap    postgres    false    5                       1259    19811    tbl_user_personalizes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tbl_user_personalizes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.tbl_user_personalizes_id_seq;
       public          postgres    false    5    286            �           0    0    tbl_user_personalizes_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.tbl_user_personalizes_id_seq OWNED BY public.tbl_user_personalizes.id;
          public          postgres    false    285            �            1259    17164 	   tbl_users    TABLE     E  CREATE TABLE public.tbl_users (
    id integer NOT NULL,
    uuid character varying(255),
    role_id integer NOT NULL,
    first_name character varying(255),
    last_name character varying(255),
    email character varying(255) NOT NULL,
    username character varying(255) NOT NULL,
    password character varying(255),
    mobile_no character varying(255),
    is_active integer DEFAULT 1,
    profile_image character varying(255),
    profile_image_path text,
    created_on timestamp without time zone NOT NULL,
    created_by integer NOT NULL,
    modified_on timestamp without time zone,
    data_access integer DEFAULT 0,
    modified_by integer,
    last_login timestamp without time zone,
    is_deleted integer DEFAULT 0,
    deleted_on timestamp without time zone,
    deleted_by integer,
    default_language_id integer
);
    DROP TABLE public.tbl_users;
       public         heap    postgres    false    5            �            1259    17172    tbl_users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tbl_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.tbl_users_id_seq;
       public          postgres    false    5    245            �           0    0    tbl_users_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.tbl_users_id_seq OWNED BY public.tbl_users.id;
          public          postgres    false    246                       1259    18542    typeorm_metadata    TABLE     �   CREATE TABLE public.typeorm_metadata (
    type character varying NOT NULL,
    database character varying,
    schema character varying,
    "table" character varying,
    name character varying,
    value text
);
 $   DROP TABLE public.typeorm_metadata;
       public         heap    postgres    false    5            J           2604    18537    migrations id    DEFAULT     n   ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);
 <   ALTER TABLE public.migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    281    280    281            D           2604    18509    tbl_access_control id    DEFAULT     ~   ALTER TABLE ONLY public.tbl_access_control ALTER COLUMN id SET DEFAULT nextval('public.tbl_access_control_id_seq'::regclass);
 D   ALTER TABLE public.tbl_access_control ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    277    276    277            H           2604    18523    tbl_access_control_pages id    DEFAULT     �   ALTER TABLE ONLY public.tbl_access_control_pages ALTER COLUMN id SET DEFAULT nextval('public.tbl_access_control_pages_id_seq'::regclass);
 J   ALTER TABLE public.tbl_access_control_pages ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    278    279    279            B           2604    18501     tbl_access_control_user_group id    DEFAULT     �   ALTER TABLE ONLY public.tbl_access_control_user_group ALTER COLUMN id SET DEFAULT nextval('public.tbl_access_control_user_group_id_seq'::regclass);
 O   ALTER TABLE public.tbl_access_control_user_group ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    275    274    275            �           2604    17173    tbl_categories id    DEFAULT     v   ALTER TABLE ONLY public.tbl_categories ALTER COLUMN id SET DEFAULT nextval('public.tbl_categories_id_seq'::regclass);
 @   ALTER TABLE public.tbl_categories ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    209            "           2604    17494    tbl_channel_category id    DEFAULT     �   ALTER TABLE ONLY public.tbl_channel_category ALTER COLUMN id SET DEFAULT nextval('public.tbl_channel_category_id_seq'::regclass);
 F   ALTER TABLE public.tbl_channel_category ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    248    247    248            �           2604    17174    tbl_channel_entries id    DEFAULT     �   ALTER TABLE ONLY public.tbl_channel_entries ALTER COLUMN id SET DEFAULT nextval('public.tbl_channel_entries_id_seq'::regclass);
 E   ALTER TABLE public.tbl_channel_entries ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    212    211            �           2604    17175    tbl_channel_entry_fields id    DEFAULT     �   ALTER TABLE ONLY public.tbl_channel_entry_fields ALTER COLUMN id SET DEFAULT nextval('public.tbl_channel_entry_fields_id_seq'::regclass);
 J   ALTER TABLE public.tbl_channel_entry_fields ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    213            �           2604    17176    tbl_channels id    DEFAULT     r   ALTER TABLE ONLY public.tbl_channels ALTER COLUMN id SET DEFAULT nextval('public.tbl_channels_id_seq'::regclass);
 >   ALTER TABLE public.tbl_channels ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216            K           2604    19806    tbl_email_template id    DEFAULT     ~   ALTER TABLE ONLY public.tbl_email_template ALTER COLUMN id SET DEFAULT nextval('public.tbl_email_template_id_seq'::regclass);
 D   ALTER TABLE public.tbl_email_template ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    284    283    284                       2604    17177    tbl_field_groups id    DEFAULT     z   ALTER TABLE ONLY public.tbl_field_groups ALTER COLUMN id SET DEFAULT nextval('public.tbl_field_groups_id_seq'::regclass);
 B   ALTER TABLE public.tbl_field_groups ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218                       2604    17178    tbl_field_options id    DEFAULT     |   ALTER TABLE ONLY public.tbl_field_options ALTER COLUMN id SET DEFAULT nextval('public.tbl_field_options_id_seq'::regclass);
 C   ALTER TABLE public.tbl_field_options ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220                       2604    17179    tbl_field_types id    DEFAULT     x   ALTER TABLE ONLY public.tbl_field_types ALTER COLUMN id SET DEFAULT nextval('public.tbl_field_types_id_seq'::regclass);
 A   ALTER TABLE public.tbl_field_types ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    222                       2604    17180    tbl_fields id    DEFAULT     n   ALTER TABLE ONLY public.tbl_fields ALTER COLUMN id SET DEFAULT nextval('public.tbl_fields_id_seq'::regclass);
 <   ALTER TABLE public.tbl_fields ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    224                       2604    17181    tbl_group_fields id    DEFAULT     z   ALTER TABLE ONLY public.tbl_group_fields ALTER COLUMN id SET DEFAULT nextval('public.tbl_group_fields_id_seq'::regclass);
 B   ALTER TABLE public.tbl_group_fields ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    226            A           2604    18468    tbl_language id    DEFAULT     r   ALTER TABLE ONLY public.tbl_language ALTER COLUMN id SET DEFAULT nextval('public.tbl_language_id_seq'::regclass);
 >   ALTER TABLE public.tbl_language ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    272    273    273                       2604    17182    tbl_member_groups id    DEFAULT     {   ALTER TABLE ONLY public.tbl_member_groups ALTER COLUMN id SET DEFAULT nextval('public.tbl_member_group_id_seq'::regclass);
 C   ALTER TABLE public.tbl_member_groups ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    230    229            M           2604    25461    tbl_member_notes_highlights id    DEFAULT     �   ALTER TABLE ONLY public.tbl_member_notes_highlights ALTER COLUMN id SET DEFAULT nextval('public.tbl_member_notes_highlights_id_seq'::regclass);
 M   ALTER TABLE public.tbl_member_notes_highlights ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    287    288    288                       2604    17183    tbl_members id    DEFAULT     p   ALTER TABLE ONLY public.tbl_members ALTER COLUMN id SET DEFAULT nextval('public.tbl_members_id_seq'::regclass);
 =   ALTER TABLE public.tbl_members ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    232    231                       2604    17184    tbl_module_permissions id    DEFAULT     �   ALTER TABLE ONLY public.tbl_module_permissions ALTER COLUMN id SET DEFAULT nextval('public.tbl_module_permissions_id_seq'::regclass);
 H   ALTER TABLE public.tbl_module_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    234    233                       2604    17185    tbl_modules id    DEFAULT     p   ALTER TABLE ONLY public.tbl_modules ALTER COLUMN id SET DEFAULT nextval('public.tbl_modules_id_seq'::regclass);
 =   ALTER TABLE public.tbl_modules ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    236    235            *           2604    18093    tbl_page id    DEFAULT     j   ALTER TABLE ONLY public.tbl_page ALTER COLUMN id SET DEFAULT nextval('public.tbl_page_id_seq'::regclass);
 :   ALTER TABLE public.tbl_page ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    259    258    259            9           2604    18296    tbl_page_aliases id    DEFAULT     z   ALTER TABLE ONLY public.tbl_page_aliases ALTER COLUMN id SET DEFAULT nextval('public.tbl_page_aliases_id_seq'::regclass);
 B   ALTER TABLE public.tbl_page_aliases ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    269    268    269            =           2604    18310    tbl_page_aliases_log id    DEFAULT     �   ALTER TABLE ONLY public.tbl_page_aliases_log ALTER COLUMN id SET DEFAULT nextval('public.tbl_page_aliases_log_id_seq'::regclass);
 F   ALTER TABLE public.tbl_page_aliases_log ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    271    270    271            +           2604    18125    tbl_pages_access_coutrol id    DEFAULT     �   ALTER TABLE ONLY public.tbl_pages_access_coutrol ALTER COLUMN id SET DEFAULT nextval('public.tbl_pages_access_coutrol_id_seq'::regclass);
 J   ALTER TABLE public.tbl_pages_access_coutrol ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    261    260    261            $           2604    18054    tbl_pages_categories id    DEFAULT     �   ALTER TABLE ONLY public.tbl_pages_categories ALTER COLUMN id SET DEFAULT nextval('public.tbl_pages_categories_id_seq'::regclass);
 F   ALTER TABLE public.tbl_pages_categories ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    253    252    253            ,           2604    18213    tbl_pages_categories_aliases id    DEFAULT     �   ALTER TABLE ONLY public.tbl_pages_categories_aliases ALTER COLUMN id SET DEFAULT nextval('public.tbl_pages_categories_aliases_id_seq'::regclass);
 N   ALTER TABLE public.tbl_pages_categories_aliases ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    262    263    263            (           2604    18080    tbl_pages_group id    DEFAULT     x   ALTER TABLE ONLY public.tbl_pages_group ALTER COLUMN id SET DEFAULT nextval('public.tbl_pages_group_id_seq'::regclass);
 A   ALTER TABLE public.tbl_pages_group ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    256    257    257            5           2604    18242    tbl_pages_group_aliases id    DEFAULT     �   ALTER TABLE ONLY public.tbl_pages_group_aliases ALTER COLUMN id SET DEFAULT nextval('public.tbl_pages_group_aliases_id_seq'::regclass);
 I   ALTER TABLE public.tbl_pages_group_aliases ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    267    266    267                       2604    17186    tbl_permitted_users id    DEFAULT     �   ALTER TABLE ONLY public.tbl_permitted_users ALTER COLUMN id SET DEFAULT nextval('public.tbl_permitted_users_id_seq'::regclass);
 E   ALTER TABLE public.tbl_permitted_users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    238    237                       2604    17187    tbl_role_permissions id    DEFAULT     �   ALTER TABLE ONLY public.tbl_role_permissions ALTER COLUMN id SET DEFAULT nextval('public.tbl_role_permissions_id_seq'::regclass);
 F   ALTER TABLE public.tbl_role_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    240    239                       2604    17188    tbl_role_user id    DEFAULT     t   ALTER TABLE ONLY public.tbl_role_user ALTER COLUMN id SET DEFAULT nextval('public.tbl_role_user_id_seq'::regclass);
 ?   ALTER TABLE public.tbl_role_user ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    242    241                       2604    17189    tbl_roles id    DEFAULT     l   ALTER TABLE ONLY public.tbl_roles ALTER COLUMN id SET DEFAULT nextval('public.tbl_roles_id_seq'::regclass);
 ;   ALTER TABLE public.tbl_roles ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    244    243            &           2604    18067    tbl_spaces id    DEFAULT     n   ALTER TABLE ONLY public.tbl_spaces ALTER COLUMN id SET DEFAULT nextval('public.tbl_spaces_id_seq'::regclass);
 <   ALTER TABLE public.tbl_spaces ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    254    255    255            1           2604    18228    tbl_spaces_aliases id    DEFAULT     ~   ALTER TABLE ONLY public.tbl_spaces_aliases ALTER COLUMN id SET DEFAULT nextval('public.tbl_spaces_aliases_id_seq'::regclass);
 D   ALTER TABLE public.tbl_spaces_aliases ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    264    265    265            #           2604    17668    tbl_trans_pages id    DEFAULT     x   ALTER TABLE ONLY public.tbl_trans_pages ALTER COLUMN id SET DEFAULT nextval('public.tbl_trans_pages_id_seq'::regclass);
 A   ALTER TABLE public.tbl_trans_pages ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    250    251    251            L           2604    19815    tbl_user_personalizes id    DEFAULT     �   ALTER TABLE ONLY public.tbl_user_personalizes ALTER COLUMN id SET DEFAULT nextval('public.tbl_user_personalizes_id_seq'::regclass);
 G   ALTER TABLE public.tbl_user_personalizes ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    286    285    286                       2604    17190    tbl_users id    DEFAULT     l   ALTER TABLE ONLY public.tbl_users ALTER COLUMN id SET DEFAULT nextval('public.tbl_users_id_seq'::regclass);
 ;   ALTER TABLE public.tbl_users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    246    245            �          0    18534 
   migrations 
   TABLE DATA           ;   COPY public.migrations (id, "timestamp", name) FROM stdin;
    public          postgres    false    281   ��      �          0    18506    tbl_access_control 
   TABLE DATA           �   COPY public.tbl_access_control (id, access_control_name, access_control_slug, created_on, created_by, modified_on, modified_by, is_deleted, deleted_on, deleted_by) FROM stdin;
    public          postgres    false    277   ��      �          0    18520    tbl_access_control_pages 
   TABLE DATA           �   COPY public.tbl_access_control_pages (id, access_control_user_group_id, spaces_id, page_group_id, page_id, created_on, created_by, modified_on, modified_by, is_deleted, deleted_on, deleted_by, channel_id, entry_id) FROM stdin;
    public          postgres    false    279   1�      �          0    18498    tbl_access_control_user_group 
   TABLE DATA           �   COPY public.tbl_access_control_user_group (id, access_control_id, member_group_id, created_on, created_by, modified_on, modified_by, is_deleted, deleted_on, deleted_by) FROM stdin;
    public          postgres    false    275   L�      m          0    17040    tbl_categories 
   TABLE DATA           �   COPY public.tbl_categories (id, category_name, category_slug, created_on, created_by, modified_on, modified_by, is_deleted, deleted_on, deleted_by, parent_id, description, image_path) FROM stdin;
    public          postgres    false    209   ��      �          0    17491    tbl_channel_category 
   TABLE DATA           c   COPY public.tbl_channel_category (id, channel_id, category_id, created_at, created_on) FROM stdin;
    public          postgres    false    248   |      o          0    17049    tbl_channel_entries 
   TABLE DATA           /  COPY public.tbl_channel_entries (id, title, description, user_id, channel_id, status, is_active, is_deleted, created_on, created_by, modified_on, modified_by, deleted_on, deleted_by, slug, cover_image, thumbnail_image, meta_title, meta_description, keyword, categories_id, related_articles) FROM stdin;
    public          postgres    false    211   ,      q          0    17057    tbl_channel_entry_fields 
   TABLE DATA           �   COPY public.tbl_channel_entry_fields (id, field_name, field_value, channel_entry_id, field_id, created_on, created_by, modified_on, modified_by, is_deleted, deleted_by, deleted_on) FROM stdin;
    public          postgres    false    213   o�      s          0    17063    tbl_channel_entry_media 
   TABLE DATA           �   COPY public.tbl_channel_entry_media (id, media_type_id, channel_entry_id, file_name, file_path, created_by, created_on, modified_on, modified_by, is_deleted, deleted_on, deleted_by) FROM stdin;
    public          postgres    false    215   j�      t          0    17069    tbl_channels 
   TABLE DATA           �   COPY public.tbl_channels (id, channel_name, slug_name, field_group_id, is_active, is_deleted, created_on, created_by, modified_on, modified_by, channel_description) FROM stdin;
    public          postgres    false    216   ��      �          0    19803    tbl_email_template 
   TABLE DATA           �   COPY public.tbl_email_template (id, template_name, template_slug, template_subject, template_message, created_by, created_on, modified_by, modified_on, deleted_by, deleted_on, is_deleted, is_active) FROM stdin;
    public          postgres    false    284   ��      v          0    17077    tbl_field_groups 
   TABLE DATA           �   COPY public.tbl_field_groups (id, group_name, created_on, created_by, modified_on, modified_by, is_deleted, deleted_on, deleted_by) FROM stdin;
    public          postgres    false    218   (�      x          0    17082    tbl_field_options 
   TABLE DATA           �   COPY public.tbl_field_options (id, option_name, option_value, field_id, created_on, created_by, modified_on, modified_by, is_deleted, deleted_on, deleted_by) FROM stdin;
    public          postgres    false    220   �      z          0    17089    tbl_field_types 
   TABLE DATA           �   COPY public.tbl_field_types (id, type_name, type_slug, is_active, is_deleted, created_by, created_on, modified_by, modified_on) FROM stdin;
    public          postgres    false    222   ��      |          0    17097 
   tbl_fields 
   TABLE DATA           B  COPY public.tbl_fields (id, field_name, field_type_id, mandatory_field, option_exist, created_on, created_by, modified_on, modified_by, is_deleted, deleted_on, deleted_by, field_desc, order_index, initial_value, placeholder, image_path, url, datetime_format, time_format, section_parent_id, character_allowed) FROM stdin;
    public          postgres    false    224   ��      ~          0    17106    tbl_group_fields 
   TABLE DATA           D   COPY public.tbl_group_fields (id, channel_id, field_id) FROM stdin;
    public          postgres    false    226   )�      �          0    18465    tbl_language 
   TABLE DATA           �   COPY public.tbl_language (id, language_name, language_code, image_path, json_path, is_status, is_default, created_by, created_on, modified_on, modified_by, is_deleted, deleted_on, deleted_by) FROM stdin;
    public          postgres    false    273   h�      �          0    17110    tbl_media_type 
   TABLE DATA           8   COPY public.tbl_media_type (id, type, slug) FROM stdin;
    public          postgres    false    228   �      �          0    17115    tbl_member_groups 
   TABLE DATA           �   COPY public.tbl_member_groups (id, name, slug, is_active, is_deleted, created_on, created_by, modified_on, modified_by, description) FROM stdin;
    public          postgres    false    229   )�      �          0    25458    tbl_member_notes_highlights 
   TABLE DATA           �   COPY public.tbl_member_notes_highlights (id, member_id, page_id, notes_highlights_content, notes_highlights_type, created_by, created_on, modified_by, modified_on, deleted_by, deleted_on, is_deleted) FROM stdin;
    public          postgres    false    288   }�      �          0    17123    tbl_members 
   TABLE DATA             COPY public.tbl_members (id, uuid, first_name, last_name, email, username, password, mobile_no, is_active, member_group_id, profile_image, profile_image_path, created_on, created_by, modified_on, modified_by, last_login, is_deleted, deleted_on, deleted_by, otp, otp_expiry) FROM stdin;
    public          postgres    false    231   ��      �          0    17131    tbl_module_permissions 
   TABLE DATA           �   COPY public.tbl_module_permissions (id, route_name, display_name, description, module_id, created_by, created_on, modified_by, modified_on, full_access_permission, parent_id, assign_permission, breadcrumb_name, order_index) FROM stdin;
    public          postgres    false    233   K�      �          0    17138    tbl_modules 
   TABLE DATA           �   COPY public.tbl_modules (id, module_name, is_active, created_by, created_on, default_module, parent_id, assign_permission, icon_path, description, order_index) FROM stdin;
    public          postgres    false    235   ��      �          0    18090    tbl_page 
   TABLE DATA           �   COPY public.tbl_page (id, spaces_id, page_group_id, parent_id, created_by, created_on, modified_by, modified_on, deleted_by, deleted_on, is_deleted) FROM stdin;
    public          postgres    false    259   ��      �          0    18293    tbl_page_aliases 
   TABLE DATA           c  COPY public.tbl_page_aliases (id, page_id, language_id, page_title, page_slug, page_description, published_on, author, excerpt, featured_images, access, meta_details, status, allow_comments, last_revision_no, last_revision_date, created_on, created_by, modified_on, modified_by, deleted_on, deleted_by, is_deleted, order_index, page_suborder) FROM stdin;
    public          postgres    false    269   ��      �          0    18307    tbl_page_aliases_log 
   TABLE DATA             COPY public.tbl_page_aliases_log (id, page_id, language_id, page_title, page_slug, page_description, published_on, author, excerpt, featured_images, access, meta_details, status, allow_comments, created_on, created_by, modified_on, modified_by, deleted_on, deleted_by) FROM stdin;
    public          postgres    false    271         �          0    18122    tbl_pages_access_coutrol 
   TABLE DATA           \   COPY public.tbl_pages_access_coutrol (id, page_id, access_type, access_item_id) FROM stdin;
    public          postgres    false    261   ֌      �          0    18051    tbl_pages_categories 
   TABLE DATA           �   COPY public.tbl_pages_categories (id, created_on, created_by, modified_on, modified_by, is_deleted, deleted_on, deleted_by, parent_id) FROM stdin;
    public          postgres    false    253   �      �          0    18210    tbl_pages_categories_aliases 
   TABLE DATA           �   COPY public.tbl_pages_categories_aliases (id, page_category_id, language_id, category_name, category_slug, description, created_on, created_by, modified_on, modified_by, is_deleted, deleted_on, deleted_by, parent_id) FROM stdin;
    public          postgres    false    263   P�      �          0    18077    tbl_pages_group 
   TABLE DATA           �   COPY public.tbl_pages_group (id, spaces_id, created_on, created_by, modified_on, modified_by, is_deleted, deleted_on, deleted_by) FROM stdin;
    public          postgres    false    257   �      �          0    18239    tbl_pages_group_aliases 
   TABLE DATA           �   COPY public.tbl_pages_group_aliases (id, page_group_id, language_id, group_name, group_slug, group_description, created_on, created_by, modified_on, modified_by, is_deleted, deleted_on, deleted_by, order_index) FROM stdin;
    public          postgres    false    267   �      �          0    17144    tbl_permitted_users 
   TABLE DATA           r   COPY public.tbl_permitted_users (id, user_id, permitted_user_id, access_type, created_by, created_on) FROM stdin;
    public          postgres    false    237   ��      �          0    17148    tbl_role_permissions 
   TABLE DATA           b   COPY public.tbl_role_permissions (id, role_id, permission_id, created_by, created_on) FROM stdin;
    public          postgres    false    239   ��      �          0    17152    tbl_role_user 
   TABLE DATA           o   COPY public.tbl_role_user (id, role_id, user_id, created_by, modified_by, modified_on, created_on) FROM stdin;
    public          postgres    false    241   M�      �          0    17156 	   tbl_roles 
   TABLE DATA           �   COPY public.tbl_roles (id, name, description, slug, is_active, is_deleted, created_on, created_by, modified_on, modified_by) FROM stdin;
    public          postgres    false    243   u�      �          0    18064 
   tbl_spaces 
   TABLE DATA           �   COPY public.tbl_spaces (id, page_category_id, created_on, created_by, modified_on, modified_by, is_deleted, deleted_on, deleted_by) FROM stdin;
    public          postgres    false    255   N�      �          0    18225    tbl_spaces_aliases 
   TABLE DATA           �   COPY public.tbl_spaces_aliases (id, spaces_id, language_id, spaces_name, spaces_slug, spaces_description, created_on, created_by, modified_on, modified_by, is_deleted, deleted_on, deleted_by, image_path) FROM stdin;
    public          postgres    false    265   �      �          0    17665    tbl_trans_pages 
   TABLE DATA           �   COPY public.tbl_trans_pages (id, page_id, lang_code, page_title, page_description, page_extra, created_at, created_by, modified_at, modified_by, deleted_at, deleted_by, is_deleted) FROM stdin;
    public          postgres    false    251   ��      �          0    19812    tbl_user_personalizes 
   TABLE DATA           �   COPY public.tbl_user_personalizes (id, user_id, menu_background_color, font_color, icon_color, logo_path, created_on, modified_on, expand_logo_path) FROM stdin;
    public          postgres    false    286   ğ      �          0    17164 	   tbl_users 
   TABLE DATA           %  COPY public.tbl_users (id, uuid, role_id, first_name, last_name, email, username, password, mobile_no, is_active, profile_image, profile_image_path, created_on, created_by, modified_on, data_access, modified_by, last_login, is_deleted, deleted_on, deleted_by, default_language_id) FROM stdin;
    public          postgres    false    245   ��      �          0    18542    typeorm_metadata 
   TABLE DATA           X   COPY public.typeorm_metadata (type, database, schema, "table", name, value) FROM stdin;
    public          postgres    false    282   Ԯ      �           0    0    migrations_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.migrations_id_seq', 1, false);
          public          postgres    false    280            �           0    0    tbl_access_control_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.tbl_access_control_id_seq', 21, true);
          public          postgres    false    276            �           0    0    tbl_access_control_pages_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.tbl_access_control_pages_id_seq', 225, true);
          public          postgres    false    278            �           0    0 $   tbl_access_control_user_group_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.tbl_access_control_user_group_id_seq', 49, true);
          public          postgres    false    274            �           0    0    tbl_categories_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.tbl_categories_id_seq', 106, true);
          public          postgres    false    210            �           0    0    tbl_channel_category_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.tbl_channel_category_id_seq', 68, true);
          public          postgres    false    247            �           0    0    tbl_channel_entries_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.tbl_channel_entries_id_seq', 62, true);
          public          postgres    false    212            �           0    0    tbl_channel_entry_fields_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.tbl_channel_entry_fields_id_seq', 81, true);
          public          postgres    false    214            �           0    0    tbl_channels_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.tbl_channels_id_seq', 58, true);
          public          postgres    false    217            �           0    0    tbl_email_template_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.tbl_email_template_id_seq', 5, true);
          public          postgres    false    283            �           0    0    tbl_field_groups_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.tbl_field_groups_id_seq', 32, true);
          public          postgres    false    219            �           0    0    tbl_field_options_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.tbl_field_options_id_seq', 72, true);
          public          postgres    false    221            �           0    0    tbl_field_types_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.tbl_field_types_id_seq', 13, true);
          public          postgres    false    223            �           0    0    tbl_fields_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.tbl_fields_id_seq', 195, true);
          public          postgres    false    225            �           0    0    tbl_group_fields_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.tbl_group_fields_id_seq', 189, true);
          public          postgres    false    227            �           0    0    tbl_language_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.tbl_language_id_seq', 6, true);
          public          postgres    false    272            �           0    0    tbl_member_group_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.tbl_member_group_id_seq', 21, true);
          public          postgres    false    230            �           0    0 "   tbl_member_notes_highlights_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.tbl_member_notes_highlights_id_seq', 1, false);
          public          postgres    false    287            �           0    0    tbl_members_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.tbl_members_id_seq', 38, true);
          public          postgres    false    232            �           0    0    tbl_module_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.tbl_module_permissions_id_seq', 98, true);
          public          postgres    false    234            �           0    0    tbl_modules_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.tbl_modules_id_seq', 17, true);
          public          postgres    false    236            �           0    0    tbl_page_aliases_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.tbl_page_aliases_id_seq', 22, true);
          public          postgres    false    268            �           0    0    tbl_page_aliases_log_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.tbl_page_aliases_log_id_seq', 70, true);
          public          postgres    false    270                        0    0    tbl_page_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.tbl_page_id_seq', 22, true);
          public          postgres    false    258                       0    0    tbl_pages_access_coutrol_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.tbl_pages_access_coutrol_id_seq', 1, false);
          public          postgres    false    260                       0    0 #   tbl_pages_categories_aliases_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.tbl_pages_categories_aliases_id_seq', 4, true);
          public          postgres    false    262                       0    0    tbl_pages_categories_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.tbl_pages_categories_id_seq', 4, true);
          public          postgres    false    252                       0    0    tbl_pages_group_aliases_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.tbl_pages_group_aliases_id_seq', 16, true);
          public          postgres    false    266                       0    0    tbl_pages_group_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.tbl_pages_group_id_seq', 16, true);
          public          postgres    false    256                       0    0    tbl_permitted_users_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.tbl_permitted_users_id_seq', 1, false);
          public          postgres    false    238                       0    0    tbl_role_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.tbl_role_permissions_id_seq', 7523, true);
          public          postgres    false    240                       0    0    tbl_role_user_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.tbl_role_user_id_seq', 1, false);
          public          postgres    false    242            	           0    0    tbl_roles_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.tbl_roles_id_seq', 34, true);
          public          postgres    false    244            
           0    0    tbl_spaces_aliases_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.tbl_spaces_aliases_id_seq', 8, true);
          public          postgres    false    264                       0    0    tbl_spaces_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.tbl_spaces_id_seq', 8, true);
          public          postgres    false    254                       0    0    tbl_trans_pages_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.tbl_trans_pages_id_seq', 1, false);
          public          postgres    false    250                       0    0    tbl_user_personalizes_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.tbl_user_personalizes_id_seq', 3, true);
          public          postgres    false    285                       0    0    tbl_users_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.tbl_users_id_seq', 69, true);
          public          postgres    false    246            �           2606    18541 )   migrations PK_8c82d7f526340ab734260ea46be 
   CONSTRAINT     i   ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT "PK_8c82d7f526340ab734260ea46be" PRIMARY KEY (id);
 U   ALTER TABLE ONLY public.migrations DROP CONSTRAINT "PK_8c82d7f526340ab734260ea46be";
       public            postgres    false    281            �           2606    18526 6   tbl_access_control_pages tbl_access_control_pages_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.tbl_access_control_pages
    ADD CONSTRAINT tbl_access_control_pages_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.tbl_access_control_pages DROP CONSTRAINT tbl_access_control_pages_pkey;
       public            postgres    false    279            �           2606    18516 *   tbl_access_control tbl_access_control_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.tbl_access_control
    ADD CONSTRAINT tbl_access_control_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.tbl_access_control DROP CONSTRAINT tbl_access_control_pkey;
       public            postgres    false    277            �           2606    18504 @   tbl_access_control_user_group tbl_access_control_user_group_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY public.tbl_access_control_user_group
    ADD CONSTRAINT tbl_access_control_user_group_pkey PRIMARY KEY (id);
 j   ALTER TABLE ONLY public.tbl_access_control_user_group DROP CONSTRAINT tbl_access_control_user_group_pkey;
       public            postgres    false    275            O           2606    17192 "   tbl_categories tbl_categories_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.tbl_categories
    ADD CONSTRAINT tbl_categories_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.tbl_categories DROP CONSTRAINT tbl_categories_pkey;
       public            postgres    false    209            �           2606    17496 .   tbl_channel_category tbl_channel_category_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.tbl_channel_category
    ADD CONSTRAINT tbl_channel_category_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.tbl_channel_category DROP CONSTRAINT tbl_channel_category_pkey;
       public            postgres    false    248            S           2606    17194 ,   tbl_channel_entries tbl_channel_entries_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.tbl_channel_entries
    ADD CONSTRAINT tbl_channel_entries_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.tbl_channel_entries DROP CONSTRAINT tbl_channel_entries_pkey;
       public            postgres    false    211            W           2606    17196 6   tbl_channel_entry_fields tbl_channel_entry_fields_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.tbl_channel_entry_fields
    ADD CONSTRAINT tbl_channel_entry_fields_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.tbl_channel_entry_fields DROP CONSTRAINT tbl_channel_entry_fields_pkey;
       public            postgres    false    213            [           2606    17198 4   tbl_channel_entry_media tbl_channel_entry_media_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.tbl_channel_entry_media
    ADD CONSTRAINT tbl_channel_entry_media_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.tbl_channel_entry_media DROP CONSTRAINT tbl_channel_entry_media_pkey;
       public            postgres    false    215            ^           2606    17200    tbl_channels tbl_channels_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.tbl_channels
    ADD CONSTRAINT tbl_channels_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.tbl_channels DROP CONSTRAINT tbl_channels_pkey;
       public            postgres    false    216            �           2606    19810 *   tbl_email_template tbl_email_template_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.tbl_email_template
    ADD CONSTRAINT tbl_email_template_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.tbl_email_template DROP CONSTRAINT tbl_email_template_pkey;
       public            postgres    false    284            `           2606    17202 &   tbl_field_groups tbl_field_groups_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.tbl_field_groups
    ADD CONSTRAINT tbl_field_groups_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.tbl_field_groups DROP CONSTRAINT tbl_field_groups_pkey;
       public            postgres    false    218            c           2606    17204 (   tbl_field_options tbl_field_options_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.tbl_field_options
    ADD CONSTRAINT tbl_field_options_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.tbl_field_options DROP CONSTRAINT tbl_field_options_pkey;
       public            postgres    false    220            e           2606    17206 $   tbl_field_types tbl_field_types_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.tbl_field_types
    ADD CONSTRAINT tbl_field_types_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.tbl_field_types DROP CONSTRAINT tbl_field_types_pkey;
       public            postgres    false    222            h           2606    17208    tbl_fields tbl_fields_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.tbl_fields
    ADD CONSTRAINT tbl_fields_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.tbl_fields DROP CONSTRAINT tbl_fields_pkey;
       public            postgres    false    224            l           2606    17210 &   tbl_group_fields tbl_group_fields_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.tbl_group_fields
    ADD CONSTRAINT tbl_group_fields_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.tbl_group_fields DROP CONSTRAINT tbl_group_fields_pkey;
       public            postgres    false    226            �           2606    18473    tbl_language tbl_language_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.tbl_language
    ADD CONSTRAINT tbl_language_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.tbl_language DROP CONSTRAINT tbl_language_pkey;
       public            postgres    false    273            n           2606    17212 "   tbl_media_type tbl_media_type_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.tbl_media_type
    ADD CONSTRAINT tbl_media_type_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.tbl_media_type DROP CONSTRAINT tbl_media_type_pkey;
       public            postgres    false    228            p           2606    17214 '   tbl_member_groups tbl_member_group_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.tbl_member_groups
    ADD CONSTRAINT tbl_member_group_pkey PRIMARY KEY (id);
 Q   ALTER TABLE ONLY public.tbl_member_groups DROP CONSTRAINT tbl_member_group_pkey;
       public            postgres    false    229            �           2606    25465 <   tbl_member_notes_highlights tbl_member_notes_highlights_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.tbl_member_notes_highlights
    ADD CONSTRAINT tbl_member_notes_highlights_pkey PRIMARY KEY (id);
 f   ALTER TABLE ONLY public.tbl_member_notes_highlights DROP CONSTRAINT tbl_member_notes_highlights_pkey;
       public            postgres    false    288            u           2606    17216    tbl_members tbl_members_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.tbl_members
    ADD CONSTRAINT tbl_members_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.tbl_members DROP CONSTRAINT tbl_members_pkey;
       public            postgres    false    231            z           2606    17218 2   tbl_module_permissions tbl_module_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.tbl_module_permissions
    ADD CONSTRAINT tbl_module_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.tbl_module_permissions DROP CONSTRAINT tbl_module_permissions_pkey;
       public            postgres    false    233            |           2606    17220    tbl_modules tbl_modules_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.tbl_modules
    ADD CONSTRAINT tbl_modules_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.tbl_modules DROP CONSTRAINT tbl_modules_pkey;
       public            postgres    false    235            �           2606    18317 .   tbl_page_aliases_log tbl_page_aliases_log_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.tbl_page_aliases_log
    ADD CONSTRAINT tbl_page_aliases_log_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.tbl_page_aliases_log DROP CONSTRAINT tbl_page_aliases_log_pkey;
       public            postgres    false    271            �           2606    18303 &   tbl_page_aliases tbl_page_aliases_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.tbl_page_aliases
    ADD CONSTRAINT tbl_page_aliases_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.tbl_page_aliases DROP CONSTRAINT tbl_page_aliases_pkey;
       public            postgres    false    269            �           2606    18129 6   tbl_pages_access_coutrol tbl_pages_access_coutrol_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.tbl_pages_access_coutrol
    ADD CONSTRAINT tbl_pages_access_coutrol_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.tbl_pages_access_coutrol DROP CONSTRAINT tbl_pages_access_coutrol_pkey;
       public            postgres    false    261            �           2606    18221 >   tbl_pages_categories_aliases tbl_pages_categories_aliases_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.tbl_pages_categories_aliases
    ADD CONSTRAINT tbl_pages_categories_aliases_pkey PRIMARY KEY (id);
 h   ALTER TABLE ONLY public.tbl_pages_categories_aliases DROP CONSTRAINT tbl_pages_categories_aliases_pkey;
       public            postgres    false    263            �           2606    18062 .   tbl_pages_categories tbl_pages_categories_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.tbl_pages_categories
    ADD CONSTRAINT tbl_pages_categories_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.tbl_pages_categories DROP CONSTRAINT tbl_pages_categories_pkey;
       public            postgres    false    253            �           2606    18249 4   tbl_pages_group_aliases tbl_pages_group_aliases_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.tbl_pages_group_aliases
    ADD CONSTRAINT tbl_pages_group_aliases_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.tbl_pages_group_aliases DROP CONSTRAINT tbl_pages_group_aliases_pkey;
       public            postgres    false    267            �           2606    18087 $   tbl_pages_group tbl_pages_group_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.tbl_pages_group
    ADD CONSTRAINT tbl_pages_group_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.tbl_pages_group DROP CONSTRAINT tbl_pages_group_pkey;
       public            postgres    false    257            �           2606    18095    tbl_page tbl_pages_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.tbl_page
    ADD CONSTRAINT tbl_pages_pkey PRIMARY KEY (id);
 A   ALTER TABLE ONLY public.tbl_page DROP CONSTRAINT tbl_pages_pkey;
       public            postgres    false    259            �           2606    17222 ,   tbl_permitted_users tbl_permitted_users_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.tbl_permitted_users
    ADD CONSTRAINT tbl_permitted_users_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.tbl_permitted_users DROP CONSTRAINT tbl_permitted_users_pkey;
       public            postgres    false    237            �           2606    17224 .   tbl_role_permissions tbl_role_permissions_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.tbl_role_permissions
    ADD CONSTRAINT tbl_role_permissions_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.tbl_role_permissions DROP CONSTRAINT tbl_role_permissions_pkey;
       public            postgres    false    239            �           2606    17226     tbl_role_user tbl_role_user_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.tbl_role_user
    ADD CONSTRAINT tbl_role_user_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.tbl_role_user DROP CONSTRAINT tbl_role_user_pkey;
       public            postgres    false    241            �           2606    17228    tbl_roles tbl_roles_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.tbl_roles
    ADD CONSTRAINT tbl_roles_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.tbl_roles DROP CONSTRAINT tbl_roles_pkey;
       public            postgres    false    243            �           2606    18235 *   tbl_spaces_aliases tbl_spaces_aliases_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.tbl_spaces_aliases
    ADD CONSTRAINT tbl_spaces_aliases_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.tbl_spaces_aliases DROP CONSTRAINT tbl_spaces_aliases_pkey;
       public            postgres    false    265            �           2606    18074    tbl_spaces tbl_spaces_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.tbl_spaces
    ADD CONSTRAINT tbl_spaces_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.tbl_spaces DROP CONSTRAINT tbl_spaces_pkey;
       public            postgres    false    255            �           2606    17672 $   tbl_trans_pages tbl_trans_pages_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.tbl_trans_pages
    ADD CONSTRAINT tbl_trans_pages_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.tbl_trans_pages DROP CONSTRAINT tbl_trans_pages_pkey;
       public            postgres    false    251            �           2606    19819 0   tbl_user_personalizes tbl_user_personalizes_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.tbl_user_personalizes
    ADD CONSTRAINT tbl_user_personalizes_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.tbl_user_personalizes DROP CONSTRAINT tbl_user_personalizes_pkey;
       public            postgres    false    286            �           2606    17230    tbl_users tbl_users_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.tbl_users
    ADD CONSTRAINT tbl_users_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.tbl_users DROP CONSTRAINT tbl_users_pkey;
       public            postgres    false    245            �           1259    17561    email_unique    INDEX     Z   CREATE INDEX email_unique ON public.tbl_users USING btree (email) WHERE (is_deleted = 0);
     DROP INDEX public.email_unique;
       public            postgres    false    245    245            T           1259    17233 4   fk_tbl_channel_entry_fields_tbl_channel_entries1_idx    INDEX     �   CREATE INDEX fk_tbl_channel_entry_fields_tbl_channel_entries1_idx ON public.tbl_channel_entry_fields USING btree (channel_entry_id);
 H   DROP INDEX public.fk_tbl_channel_entry_fields_tbl_channel_entries1_idx;
       public            postgres    false    213            U           1259    17234 +   fk_tbl_channel_entry_fields_tbl_fields1_idx    INDEX     t   CREATE INDEX fk_tbl_channel_entry_fields_tbl_fields1_idx ON public.tbl_channel_entry_fields USING btree (field_id);
 ?   DROP INDEX public.fk_tbl_channel_entry_fields_tbl_fields1_idx;
       public            postgres    false    213            \           1259    17235 %   fk_tbl_channels_tbl_field_groups1_idx    INDEX     h   CREATE INDEX fk_tbl_channels_tbl_field_groups1_idx ON public.tbl_channels USING btree (field_group_id);
 9   DROP INDEX public.fk_tbl_channels_tbl_field_groups1_idx;
       public            postgres    false    216            a           1259    17236 $   fk_tbl_field_options_tbl_fields1_idx    INDEX     f   CREATE INDEX fk_tbl_field_options_tbl_fields1_idx ON public.tbl_field_options USING btree (field_id);
 8   DROP INDEX public.fk_tbl_field_options_tbl_fields1_idx;
       public            postgres    false    220            f           1259    17237 "   fk_tbl_fields_tbl_field_types1_idx    INDEX     b   CREATE INDEX fk_tbl_fields_tbl_field_types1_idx ON public.tbl_fields USING btree (field_type_id);
 6   DROP INDEX public.fk_tbl_fields_tbl_field_types1_idx;
       public            postgres    false    224            i           1259    17238 )   fk_tbl_group_fields_tbl_field_groups1_idx    INDEX     l   CREATE INDEX fk_tbl_group_fields_tbl_field_groups1_idx ON public.tbl_group_fields USING btree (channel_id);
 =   DROP INDEX public.fk_tbl_group_fields_tbl_field_groups1_idx;
       public            postgres    false    226            j           1259    17239 #   fk_tbl_group_fields_tbl_fields1_idx    INDEX     d   CREATE INDEX fk_tbl_group_fields_tbl_fields1_idx ON public.tbl_group_fields USING btree (field_id);
 7   DROP INDEX public.fk_tbl_group_fields_tbl_fields1_idx;
       public            postgres    false    226            �           1259    17240    fk_tbl_group_permissions_1_idx    INDEX     b   CREATE INDEX fk_tbl_group_permissions_1_idx ON public.tbl_role_permissions USING btree (role_id);
 2   DROP INDEX public.fk_tbl_group_permissions_1_idx;
       public            postgres    false    239            �           1259    17241 '   fk_tbl_group_permissions_permission_idx    INDEX     q   CREATE INDEX fk_tbl_group_permissions_permission_idx ON public.tbl_role_permissions USING btree (permission_id);
 ;   DROP INDEX public.fk_tbl_group_permissions_permission_idx;
       public            postgres    false    239            �           1259    17242 $   fk_tbl_group_user_tbl_user_group_idx    INDEX     a   CREATE INDEX fk_tbl_group_user_tbl_user_group_idx ON public.tbl_role_user USING btree (role_id);
 8   DROP INDEX public.fk_tbl_group_user_tbl_user_group_idx;
       public            postgres    false    241            �           1259    17243     fk_tbl_group_user_tbl_users1_idx    INDEX     ]   CREATE INDEX fk_tbl_group_user_tbl_users1_idx ON public.tbl_role_user USING btree (user_id);
 4   DROP INDEX public.fk_tbl_group_user_tbl_users1_idx;
       public            postgres    false    241            X           1259    17244 $   fk_tbl_list_media_tb_media_type1_idx    INDEX     q   CREATE INDEX fk_tbl_list_media_tb_media_type1_idx ON public.tbl_channel_entry_media USING btree (media_type_id);
 8   DROP INDEX public.fk_tbl_list_media_tb_media_type1_idx;
       public            postgres    false    215            Y           1259    17245 "   fk_tbl_list_media_tbl_listing1_idx    INDEX     r   CREATE INDEX fk_tbl_list_media_tbl_listing1_idx ON public.tbl_channel_entry_media USING btree (channel_entry_id);
 6   DROP INDEX public.fk_tbl_list_media_tbl_listing1_idx;
       public            postgres    false    215            P           1259    17247     fk_tbl_listing_tbl_channels1_idx    INDEX     f   CREATE INDEX fk_tbl_listing_tbl_channels1_idx ON public.tbl_channel_entries USING btree (channel_id);
 4   DROP INDEX public.fk_tbl_listing_tbl_channels1_idx;
       public            postgres    false    211            Q           1259    17248    fk_tbl_listing_tbl_users1_idx    INDEX     `   CREATE INDEX fk_tbl_listing_tbl_users1_idx ON public.tbl_channel_entries USING btree (user_id);
 1   DROP INDEX public.fk_tbl_listing_tbl_users1_idx;
       public            postgres    false    211            q           1259    17249 $   fk_tbl_members_tbl_member_group1_idx    INDEX     g   CREATE INDEX fk_tbl_members_tbl_member_group1_idx ON public.tbl_members USING btree (member_group_id);
 8   DROP INDEX public.fk_tbl_members_tbl_member_group1_idx;
       public            postgres    false    231            w           1259    17250    fk_tbl_permissions_1_idx    INDEX     `   CREATE INDEX fk_tbl_permissions_1_idx ON public.tbl_module_permissions USING btree (module_id);
 ,   DROP INDEX public.fk_tbl_permissions_1_idx;
       public            postgres    false    233            }           1259    17251 %   fk_tbl_permitted_users_tbl_users1_idx    INDEX     h   CREATE INDEX fk_tbl_permitted_users_tbl_users1_idx ON public.tbl_permitted_users USING btree (user_id);
 9   DROP INDEX public.fk_tbl_permitted_users_tbl_users1_idx;
       public            postgres    false    237            ~           1259    17252 %   fk_tbl_permitted_users_tbl_users2_idx    INDEX     r   CREATE INDEX fk_tbl_permitted_users_tbl_users2_idx ON public.tbl_permitted_users USING btree (permitted_user_id);
 9   DROP INDEX public.fk_tbl_permitted_users_tbl_users2_idx;
       public            postgres    false    237            �           1259    17253    fk_tbl_users_tbl_roles1_idx    INDEX     T   CREATE INDEX fk_tbl_users_tbl_roles1_idx ON public.tbl_users USING btree (role_id);
 /   DROP INDEX public.fk_tbl_users_tbl_roles1_idx;
       public            postgres    false    245            r           1259    17559    mem_email_unique    INDEX     `   CREATE INDEX mem_email_unique ON public.tbl_members USING btree (email) WHERE (is_deleted = 0);
 $   DROP INDEX public.mem_email_unique;
       public            postgres    false    231    231            s           1259    17560    mem_mobile_no_unique    INDEX     h   CREATE INDEX mem_mobile_no_unique ON public.tbl_members USING btree (mobile_no) WHERE (is_deleted = 0);
 (   DROP INDEX public.mem_mobile_no_unique;
       public            postgres    false    231    231            �           1259    17562    mobile_no_unique    INDEX     b   CREATE INDEX mobile_no_unique ON public.tbl_users USING btree (mobile_no) WHERE (is_deleted = 0);
 $   DROP INDEX public.mobile_no_unique;
       public            postgres    false    245    245            �           1259    18527 5   tbl_access_control_pages_access_control_user_group_id    INDEX     �   CREATE INDEX tbl_access_control_pages_access_control_user_group_id ON public.tbl_access_control_pages USING btree (access_control_user_group_id);
 I   DROP INDEX public.tbl_access_control_pages_access_control_user_group_id;
       public            postgres    false    279            �           1259    18529 &   tbl_access_control_pages_page_group_id    INDEX     t   CREATE INDEX tbl_access_control_pages_page_group_id ON public.tbl_access_control_pages USING btree (page_group_id);
 :   DROP INDEX public.tbl_access_control_pages_page_group_id;
       public            postgres    false    279            �           1259    18530     tbl_access_control_pages_page_id    INDEX     h   CREATE INDEX tbl_access_control_pages_page_id ON public.tbl_access_control_pages USING btree (page_id);
 4   DROP INDEX public.tbl_access_control_pages_page_id;
       public            postgres    false    279            �           1259    18528 "   tbl_access_control_pages_spaces_id    INDEX     l   CREATE INDEX tbl_access_control_pages_spaces_id ON public.tbl_access_control_pages USING btree (spaces_id);
 6   DROP INDEX public.tbl_access_control_pages_spaces_id;
       public            postgres    false    279            �           1259    18517 /   tbl_access_control_user_group_access_control_id    INDEX     �   CREATE INDEX tbl_access_control_user_group_access_control_id ON public.tbl_access_control_user_group USING btree (access_control_id);
 C   DROP INDEX public.tbl_access_control_user_group_access_control_id;
       public            postgres    false    275            �           1259    18518 -   tbl_access_control_user_group_member_group_id    INDEX     �   CREATE INDEX tbl_access_control_user_group_member_group_id ON public.tbl_access_control_user_group USING btree (member_group_id);
 A   DROP INDEX public.tbl_access_control_user_group_member_group_id;
       public            postgres    false    275            x           1259    17257    tbl_module_permisison_unique    INDEX     y   CREATE UNIQUE INDEX tbl_module_permisison_unique ON public.tbl_module_permissions USING btree (display_name, module_id);
 0   DROP INDEX public.tbl_module_permisison_unique;
       public            postgres    false    233    233            �           1259    18305    tbl_page_aliases_language_id    INDEX     `   CREATE INDEX tbl_page_aliases_language_id ON public.tbl_page_aliases USING btree (language_id);
 0   DROP INDEX public.tbl_page_aliases_language_id;
       public            postgres    false    269            �           1259    18319     tbl_page_aliases_log_language_id    INDEX     d   CREATE INDEX tbl_page_aliases_log_language_id ON public.tbl_page_aliases USING btree (language_id);
 4   DROP INDEX public.tbl_page_aliases_log_language_id;
       public            postgres    false    269            �           1259    18318    tbl_page_aliases_log_page_id    INDEX     \   CREATE INDEX tbl_page_aliases_log_page_id ON public.tbl_page_aliases USING btree (page_id);
 0   DROP INDEX public.tbl_page_aliases_log_page_id;
       public            postgres    false    269            �           1259    18304    tbl_page_aliases_page_id    INDEX     X   CREATE INDEX tbl_page_aliases_page_id ON public.tbl_page_aliases USING btree (page_id);
 ,   DROP INDEX public.tbl_page_aliases_page_id;
       public            postgres    false    269            �           1259    18131 $   tbl_pages_access_coutrol_access_type    INDEX     p   CREATE INDEX tbl_pages_access_coutrol_access_type ON public.tbl_pages_access_coutrol USING btree (access_type);
 8   DROP INDEX public.tbl_pages_access_coutrol_access_type;
       public            postgres    false    261            �           1259    18130 (   tbl_pages_access_coutrol_member_group_id    INDEX     p   CREATE INDEX tbl_pages_access_coutrol_member_group_id ON public.tbl_pages_access_coutrol USING btree (page_id);
 <   DROP INDEX public.tbl_pages_access_coutrol_member_group_id;
       public            postgres    false    261            �           1259    18223 (   tbl_pages_categories_aliases_language_id    INDEX     x   CREATE INDEX tbl_pages_categories_aliases_language_id ON public.tbl_pages_categories_aliases USING btree (language_id);
 <   DROP INDEX public.tbl_pages_categories_aliases_language_id;
       public            postgres    false    263            �           1259    18222 -   tbl_pages_categories_aliases_page_category_id    INDEX     �   CREATE INDEX tbl_pages_categories_aliases_page_category_id ON public.tbl_pages_categories_aliases USING btree (page_category_id);
 A   DROP INDEX public.tbl_pages_categories_aliases_page_category_id;
       public            postgres    false    263            �           1259    18251 #   tbl_pages_group_aliases_language_id    INDEX     n   CREATE INDEX tbl_pages_group_aliases_language_id ON public.tbl_pages_group_aliases USING btree (language_id);
 7   DROP INDEX public.tbl_pages_group_aliases_language_id;
       public            postgres    false    267            �           1259    18250 %   tbl_pages_group_aliases_page_group_id    INDEX     r   CREATE INDEX tbl_pages_group_aliases_page_group_id ON public.tbl_pages_group_aliases USING btree (page_group_id);
 9   DROP INDEX public.tbl_pages_group_aliases_page_group_id;
       public            postgres    false    267            �           1259    18088    tbl_pages_group_spaces_id    INDEX     Z   CREATE INDEX tbl_pages_group_spaces_id ON public.tbl_pages_group USING btree (spaces_id);
 -   DROP INDEX public.tbl_pages_group_spaces_id;
       public            postgres    false    257            �           1259    17258    tbl_role_permisison_unique    INDEX     t   CREATE UNIQUE INDEX tbl_role_permisison_unique ON public.tbl_role_permissions USING btree (role_id, permission_id);
 .   DROP INDEX public.tbl_role_permisison_unique;
       public            postgres    false    239    239            �           1259    18237    tbl_spaces_aliases_language_id    INDEX     d   CREATE INDEX tbl_spaces_aliases_language_id ON public.tbl_spaces_aliases USING btree (language_id);
 2   DROP INDEX public.tbl_spaces_aliases_language_id;
       public            postgres    false    265            �           1259    18236    tbl_spaces_aliases_spaces_id    INDEX     `   CREATE INDEX tbl_spaces_aliases_spaces_id ON public.tbl_spaces_aliases USING btree (spaces_id);
 0   DROP INDEX public.tbl_spaces_aliases_spaces_id;
       public            postgres    false    265            �           1259    18075    tbl_spaces_page_category_id    INDEX     ^   CREATE INDEX tbl_spaces_page_category_id ON public.tbl_spaces USING btree (page_category_id);
 /   DROP INDEX public.tbl_spaces_page_category_id;
       public            postgres    false    255            v           1259    19710    username_mem_unique    INDEX     m   CREATE UNIQUE INDEX username_mem_unique ON public.tbl_members USING btree (username) WHERE (is_deleted = 0);
 '   DROP INDEX public.username_mem_unique;
       public            postgres    false    231    231            �           1259    25249    username_unique    INDEX     `   CREATE INDEX username_unique ON public.tbl_users USING btree (username) WHERE (is_deleted = 0);
 #   DROP INDEX public.username_unique;
       public            postgres    false    245    245            �           2606    17261 I   tbl_channel_entry_fields fk_tbl_channel_entry_fields_tbl_channel_entries1    FK CONSTRAINT     �   ALTER TABLE ONLY public.tbl_channel_entry_fields
    ADD CONSTRAINT fk_tbl_channel_entry_fields_tbl_channel_entries1 FOREIGN KEY (channel_entry_id) REFERENCES public.tbl_channel_entries(id);
 s   ALTER TABLE ONLY public.tbl_channel_entry_fields DROP CONSTRAINT fk_tbl_channel_entry_fields_tbl_channel_entries1;
       public          postgres    false    211    4435    213            �           2606    17266 @   tbl_channel_entry_fields fk_tbl_channel_entry_fields_tbl_fields1    FK CONSTRAINT     �   ALTER TABLE ONLY public.tbl_channel_entry_fields
    ADD CONSTRAINT fk_tbl_channel_entry_fields_tbl_fields1 FOREIGN KEY (field_id) REFERENCES public.tbl_fields(id);
 j   ALTER TABLE ONLY public.tbl_channel_entry_fields DROP CONSTRAINT fk_tbl_channel_entry_fields_tbl_fields1;
       public          postgres    false    213    224    4456            �           2606    17276 2   tbl_field_options fk_tbl_field_options_tbl_fields1    FK CONSTRAINT     �   ALTER TABLE ONLY public.tbl_field_options
    ADD CONSTRAINT fk_tbl_field_options_tbl_fields1 FOREIGN KEY (field_id) REFERENCES public.tbl_fields(id);
 \   ALTER TABLE ONLY public.tbl_field_options DROP CONSTRAINT fk_tbl_field_options_tbl_fields1;
       public          postgres    false    220    224    4456            �           2606    17281 )   tbl_fields fk_tbl_fields_tbl_field_types1    FK CONSTRAINT     �   ALTER TABLE ONLY public.tbl_fields
    ADD CONSTRAINT fk_tbl_fields_tbl_field_types1 FOREIGN KEY (field_type_id) REFERENCES public.tbl_field_types(id);
 S   ALTER TABLE ONLY public.tbl_fields DROP CONSTRAINT fk_tbl_fields_tbl_field_types1;
       public          postgres    false    222    224    4453            �           2606    17291 0   tbl_group_fields fk_tbl_group_fields_tbl_fields1    FK CONSTRAINT     �   ALTER TABLE ONLY public.tbl_group_fields
    ADD CONSTRAINT fk_tbl_group_fields_tbl_fields1 FOREIGN KEY (field_id) REFERENCES public.tbl_fields(id);
 Z   ALTER TABLE ONLY public.tbl_group_fields DROP CONSTRAINT fk_tbl_group_fields_tbl_fields1;
       public          postgres    false    224    226    4456            �           2606    17301 8   tbl_role_permissions fk_tbl_group_permissions_permission    FK CONSTRAINT     �   ALTER TABLE ONLY public.tbl_role_permissions
    ADD CONSTRAINT fk_tbl_group_permissions_permission FOREIGN KEY (permission_id) REFERENCES public.tbl_module_permissions(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 b   ALTER TABLE ONLY public.tbl_role_permissions DROP CONSTRAINT fk_tbl_group_permissions_permission;
       public          postgres    false    239    4474    233            �           2606    17306 .   tbl_role_user fk_tbl_group_user_tbl_user_group    FK CONSTRAINT     �   ALTER TABLE ONLY public.tbl_role_user
    ADD CONSTRAINT fk_tbl_group_user_tbl_user_group FOREIGN KEY (role_id) REFERENCES public.tbl_roles(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 X   ALTER TABLE ONLY public.tbl_role_user DROP CONSTRAINT fk_tbl_group_user_tbl_user_group;
       public          postgres    false    241    4491    243            �           2606    17311 *   tbl_role_user fk_tbl_group_user_tbl_users1    FK CONSTRAINT     �   ALTER TABLE ONLY public.tbl_role_user
    ADD CONSTRAINT fk_tbl_group_user_tbl_users1 FOREIGN KEY (user_id) REFERENCES public.tbl_users(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 T   ALTER TABLE ONLY public.tbl_role_user DROP CONSTRAINT fk_tbl_group_user_tbl_users1;
       public          postgres    false    241    4496    245            �           2606    17316 8   tbl_channel_entry_media fk_tbl_list_media_tb_media_type1    FK CONSTRAINT     �   ALTER TABLE ONLY public.tbl_channel_entry_media
    ADD CONSTRAINT fk_tbl_list_media_tb_media_type1 FOREIGN KEY (media_type_id) REFERENCES public.tbl_media_type(id);
 b   ALTER TABLE ONLY public.tbl_channel_entry_media DROP CONSTRAINT fk_tbl_list_media_tb_media_type1;
       public          postgres    false    215    4462    228            �           2606    17321 6   tbl_channel_entry_media fk_tbl_list_media_tbl_listing1    FK CONSTRAINT     �   ALTER TABLE ONLY public.tbl_channel_entry_media
    ADD CONSTRAINT fk_tbl_list_media_tbl_listing1 FOREIGN KEY (channel_entry_id) REFERENCES public.tbl_channel_entries(id);
 `   ALTER TABLE ONLY public.tbl_channel_entry_media DROP CONSTRAINT fk_tbl_list_media_tbl_listing1;
       public          postgres    false    4435    211    215            �           2606    17331 0   tbl_channel_entries fk_tbl_listing_tbl_channels1    FK CONSTRAINT     �   ALTER TABLE ONLY public.tbl_channel_entries
    ADD CONSTRAINT fk_tbl_listing_tbl_channels1 FOREIGN KEY (channel_id) REFERENCES public.tbl_channels(id);
 Z   ALTER TABLE ONLY public.tbl_channel_entries DROP CONSTRAINT fk_tbl_listing_tbl_channels1;
       public          postgres    false    211    216    4446            �           2606    17341 ,   tbl_members fk_tbl_members_tbl_member_group1    FK CONSTRAINT     �   ALTER TABLE ONLY public.tbl_members
    ADD CONSTRAINT fk_tbl_members_tbl_member_group1 FOREIGN KEY (member_group_id) REFERENCES public.tbl_member_groups(id);
 V   ALTER TABLE ONLY public.tbl_members DROP CONSTRAINT fk_tbl_members_tbl_member_group1;
       public          postgres    false    229    4464    231            �           2606    17346 +   tbl_module_permissions fk_tbl_permissions_1    FK CONSTRAINT     �   ALTER TABLE ONLY public.tbl_module_permissions
    ADD CONSTRAINT fk_tbl_permissions_1 FOREIGN KEY (module_id) REFERENCES public.tbl_modules(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 U   ALTER TABLE ONLY public.tbl_module_permissions DROP CONSTRAINT fk_tbl_permissions_1;
       public          postgres    false    233    235    4476            �           2606    17351 5   tbl_permitted_users fk_tbl_permitted_users_tbl_users1    FK CONSTRAINT     �   ALTER TABLE ONLY public.tbl_permitted_users
    ADD CONSTRAINT fk_tbl_permitted_users_tbl_users1 FOREIGN KEY (user_id) REFERENCES public.tbl_users(id);
 _   ALTER TABLE ONLY public.tbl_permitted_users DROP CONSTRAINT fk_tbl_permitted_users_tbl_users1;
       public          postgres    false    237    4496    245            �           2606    17356 5   tbl_permitted_users fk_tbl_permitted_users_tbl_users2    FK CONSTRAINT     �   ALTER TABLE ONLY public.tbl_permitted_users
    ADD CONSTRAINT fk_tbl_permitted_users_tbl_users2 FOREIGN KEY (permitted_user_id) REFERENCES public.tbl_users(id);
 _   ALTER TABLE ONLY public.tbl_permitted_users DROP CONSTRAINT fk_tbl_permitted_users_tbl_users2;
       public          postgres    false    245    237    4496            �           2606    17361 !   tbl_users fk_tbl_users_tbl_roles1    FK CONSTRAINT     �   ALTER TABLE ONLY public.tbl_users
    ADD CONSTRAINT fk_tbl_users_tbl_roles1 FOREIGN KEY (role_id) REFERENCES public.tbl_roles(id);
 K   ALTER TABLE ONLY public.tbl_users DROP CONSTRAINT fk_tbl_users_tbl_roles1;
       public          postgres    false    245    4491    243            �           2606    17507 4   tbl_channel_category tbl_channel_category_channel_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.tbl_channel_category
    ADD CONSTRAINT tbl_channel_category_channel_id FOREIGN KEY (channel_id) REFERENCES public.tbl_channels(id);
 ^   ALTER TABLE ONLY public.tbl_channel_category DROP CONSTRAINT tbl_channel_category_channel_id;
       public          postgres    false    248    216    4446            �           2606    19865 1   tbl_group_fields tbl_group_fields_channel_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tbl_group_fields
    ADD CONSTRAINT tbl_group_fields_channel_id_fkey FOREIGN KEY (channel_id) REFERENCES public.tbl_channels(id) NOT VALID;
 [   ALTER TABLE ONLY public.tbl_group_fields DROP CONSTRAINT tbl_group_fields_channel_id_fkey;
       public          postgres    false    226    4446    216            �           2606    25244 6   tbl_role_permissions tbl_role_permissions_role_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tbl_role_permissions
    ADD CONSTRAINT tbl_role_permissions_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.tbl_roles(id) NOT VALID;
 `   ALTER TABLE ONLY public.tbl_role_permissions DROP CONSTRAINT tbl_role_permissions_role_id_fkey;
       public          postgres    false    239    4491    243            �           2606    19820 6   tbl_user_personalizes tbl_user_personalizes_useid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tbl_user_personalizes
    ADD CONSTRAINT tbl_user_personalizes_useid_fkey FOREIGN KEY (user_id) REFERENCES public.tbl_users(id);
 `   ALTER TABLE ONLY public.tbl_user_personalizes DROP CONSTRAINT tbl_user_personalizes_useid_fkey;
       public          postgres    false    4496    286    245            �      x������ � �      �   Y  x���ێ�0�����Py| ��]�T�mUn�&@DS�%о~gb��l�H�@c���9��:�EŏM}=�l��ۖe�!)�Z�ć��Jm�b�����ӄ�h�[%֤�l�Z���|�-���� ����Ȗ쒷��:���D�2�R�)z!`!S����(�a߲j�����+���*]�������/��)RZՅ�Z���i��-�۫T�u��̡�Lj!����u�����զN�̳C޴|w��=�	����K*���<AjP��h򲸖�ի�U==Ϟ�1kf��0�&��J���+��e�����
�����
Hl?��� �����}S�/E]�W��q�⩜rݞ�G��X@�뺺�ե�
��[pz!��ƪ�T�qS��D�_"�ހY�Tq��������S�cp,��lAc,��ٜ~�B�[��5IX�P啯��9�3��"vto�5X�����ϻ�����|0)�&h"��/���t���V����h�[�c�V�u�X�~�FA�a�Д_��a?R�pbţ��h ���mq�����[
��uUZY��SIp4�����(3.	BٛW��/Q�ZE�;      �     x���[��8 �oz���cY~��� �_�H�������G����%c��,��5��Ϸɫu��ϖ��:ߦ����D�*�4L�LV0��M4f	mn�ۤ�j�3����c����nw�/�	��/P£?][Τo�W�V��)�c7<�N��`e���~�&X�wPL���F��'���Co9(ε��r�8�>z���i:���^�4��W&k���Ot���O����@t�'6W��,�>vٰ:[�Pr�ҰO����g��j�R�@%�$���Q��q��5�-tS&N���ޅ���$P�@�s�6C�]���C��e�I����Iǋ�5N��KW��Ѕq\kX����(h����Ð�~5�a�S�~e�V�S�t�}���vJ�笫l��y�Z��FH.�/W҄�7n��ݸاst	�RBU�c�ֲ:ޓf�#PVAP�}`<���91�@�918�t���*�K�w���L��2/N�8�:���m�����a����y�7:������a��ŽN���m:���6��ʍ<���s�8���}'��)?�v��S~��@uz����8h>�	KU5T~�ê���6�G�uv5�w+۔�U�)?4�/l�d�f\�6��Nm�$��V��Nm6ڝ��?@��{i�v/�<]ෲ��FXF�آ�爉�~�*8�������("��HT �>A�5�%�(��Ю�(��8V�D�q �HBA4D�6ҭl�P��?+Tm"�<�\�\P(�*�X�UѶ�$������2�Ѝ6\��̈́Lu9	�l�nAY�f�u���h�uO�*�[�{5���o�[�6���S\�����c�vu�e`�y+]����o�U-	�X��iJ/��)C��MI�>��הiAl3��fj��)�����5L~�KhXᎠ���~*���h��N"�3a>�Ŝ+�x�yM�e�_=\u��N:��4N8��:��~�l����x�D�Q����F�}�_G�~aZ}8��)�]�t������	�Ib�@�s���ҽ	3��Zh�B�w��R�4ZnAT���ZpB�Tϭ�H��:z�t�R&�3%�I ]��@�d'#�*�	*�Kv��f$;�@�d''�.�^ ]�C��ɦ�t�u�$�.�Y U��H���%;S����(�*��	�K�H��P!]��f��W4���Z�ԏ���W'\�F!��.����
Z*�p>��Fd�.�;�	�%�׵n��ť�Qd?W�(�V��!X~,�,17�.f��y�(#�-��9�����C!�9bp�Q�����������Ybn�J�F�f`��+Lh0�>u�T}���4��;K��J]�[�����Ҋ����`��|��l���y��J�7HF!�_�
� T�O�-�^��M�;���.����o�S�R��.1����G��9��	��"�D��0GLuva~a>>��j��1���]�0,FO�	ǳu&�N����zvE��5����w����T�m�\yG֘�(��(�����;¢���E�F�n}�T�'��L�o�o]�p�Z�W�;�VN���uG(��M����`�c�bx�b:��'�Y"�z�F�`t��\�_��'Yދ�8G�s���=ɉ�{s���k���P%m�)9iNƓHʌg�t���ޓ�Jʌ[�����{���8�6<!�'y��U�f<�S2�DRf<���8��5<'�'A��G*e�'��$I�q�txVxO�")3���x�����@�_�����������������k�      �   �  x���ɑ1E��(��\XnA8��?�����2=U}�>A�d	�I��F�E�~ۇ�h�d$z8>���9�Z������SC:�̥I�]�kg���+C�$\Ns0y�qF�y&?��=s(c�=����T��h���K5����2X��B#i1�>��0R�gIj����F��J�;=�V��n�p�j�ӱ��Il�֎�LBВ0���ʪs��OR"M�����TO�h���lJ�)E����G)р�da�J?#���j'u]���0��_��@NBy�4*��DⓜD�1�qQêձ⺴�65���r�"�^q�t��x������嶵�D�奅M�eez�,�m��`7G����y�ܫH�>l�TA���TkM������q��})�rv����r鎻;�C0�S�Fl?�e?����E���le���M��.�1��t��Ԅ��i�����q9=h��9԰�H;��]bKp�Ț�J�rP�ʩ�ht�+;�tT��t�������ޗV&�O��d��]�!������b��]�!�O�ӻ�3��v�JM�*����It��x��-����]t��`�s���;X=��VmVK�Z����7�9\��%���Wi���V�m�i�Z��,R=�      m      x��[ے�8�}F}^�aϖԼ_����|��m���َ�pP$$�E�2AJ�~���������=	�IIU�ݗ]��D���D"3����Q�z-��(��b-򊕪e}h�˞�Ĵ�Μ`f��b�����|����e��J��T�X�]}���N�w�U���d,`�)��o�q���c�@�oB1����X���?�P&�\u�T��ݟ�r[(��~�,�Ĳ(S!YZT��NC�@�;��!��k����/<v���J�����c��g�=��#�l�S�N��k!+�l�f	oX�s�U����Ъ��Ĳ�i�ߙk��P��±ٳ����bQ��R�x-�loZ$�$$ӛ��F��93h �l[�:�<.�,2^,���K�s	U滴Zq"�R��*��*"�kQ��|�E��V��"Svaz��x��h�C�5g�{l �~���g9�1�,��i�,�'H��ߚ��n�����Y)z-������6����Ɖ�p�:H��Мpfxǐ!K�����
�d��r�����/���cY$JQ�F�8�#��ӻ:��m���[��t�G�ٵ��*�Vx�m�8��S�)�[������s�#�$�$��E]�?�QY�qS��7	T]�^������M���D��g���\�j�4�!S��жQ��l�+�M$�˅;�l�=Y`�Û�nڡZ��k��ժ��A����޶�Ҝ?R)��^��v�,+�hVt_v�w��15��S�H��"wHN�[Q��b�'�Y�~3��À���9�6����n�w�)�g(7� -�N�L���u�܀zz��@5����Ů�b��6��P�m6�R�u��L��h�՟>2��3s��MZJ���:�N�d�9XK�b���w���p�"��%\[ϤA��G���G%�4g���ut57=XNt���L�MY@�%,�g2NE�����C��3�9�՜X�\��պ�VU8�����'	X�����l3x���G9��0��I����gu~���7���O�0����|x�s��*WK��3ξ�UQ"���b-�4�7>"|�)MV{jx�������v�з�_6bya��9A0��4X���@��	'ײ�b滆�g��i5�����2o�FԜ�S��U����N��z��U�X8J3M��qk�_B� �޷.V.7DZ���@���h�rه"*�͊�\�� ��y�.X��ߤy���9ƼVs?�O��퍎u�t�#.E��e����z�QKIO�e�g´4�jY�
�ޏ�R䢌2�)�M�늯���z\�s�W6Y�KL7���\nc���<*�'l �+<�{�P���Ut!��vݯH�7z/��L{�x�N
~鿧�;~�& �'\@dq%�XW�Q�`Ċz�J�#R����%��� Rh���E�dڍ5��e@�}.Z�u�Q��M�W1]�U
��)^�4�$HOb��a.uZ��?#�Gnb�����z��ÇP����M!��dbW��V�h!@�����k�����C���o�����J>�t�3��λ��qJ& ��� .&à��Z->߫�C�lA���ͣ9��\D2�ԉf�e�Ӎ,�ZǏ��t���|'���.�mA^���i�%f~I_������AvW���F�� �N�)OR�Y�� `W�7����@E;]PI� ��i|�U�z�@�î��};�K�2�� �V�S��JN)���4@��!E��)>h� t֢A��E?)�gR���kݥu��Z�17y�+:f����G����?���
qIS�����R{�U�%`;�����Q�r^�7�h�&�m�� @�:�%��P��,h�� 3�䢠YB`[�Gt�Ƭ�������[�����!k&Ԓ�5*�(�i�GF�Kcr�n���Ƿ�m��:琦	���ըB:�e�{V�(�?�{`�=Y��N-��-<���
IAS��W �:|C>�����GieX�Ҙ�Tkxw3*����G�3��
�Ny]M�iM��ύ��L6wE*GN�j�HU��Ź���Z�jB�y���PVT�
�@�ew��@��<AÁ�!5�L��������$���U]�7b�e��2��I)�9`0�(�
Ե��\9r�H���D��.G�3�$�O�Q�*��IW�< "�L��#)��
\X�+�ܩ�N_a���tj��;X3=��g��E������M�{��u��N�N�oF��V�pB/Kr~&[6߽�b��~�TN����$�E�X�|��4Uz�<ѳd�n03�^��Y���4m1�؋���pڈ���VW,�*���+�Q�cR�ط�������-ˢސ�~'�AJ�;n6��ZvDl�<0X|#�PqC�4+��W��������y��^�f���v�eQ 5@��Y���W��>V��I�=�q�Y��c7t7��A����|f����g��~gA��>���\<~�6|u󷛗�~+_�����o2I>}���J��2��_�'�o8fh�e;��>�T�׿��/^��;���߿֓僭H��ǿ]��l6��n���'�?>���/_-��O�w'�����O�C��&_>t㯖k<zx�5�	�c�6y4�k��>]���G��){3�9��h��4�b~U V�<A�UM��ō('O��g�X�k�%��2aL��m�N�e��r�XȦs���)�ҷFK,�P<�[W1玺��Z�jI?�U�S	�r�B��1-,���cG��<J��-ʤZ�آ�����B�𚰆B7ʨ��R����n\ā
mi���J�ʲT�ݛ���x�.2�ջ#]�]��熆g�h>zh{�	g�T��2[A��#*��М�Z�6�i�[�U��|�S�@�!vJŉ����ϿJ����
x�K���y=��A��k"�Ό`jZ~k�!�Pl�,*����iZ��n(!-��I��=v_�Xl��Ɖ ^�����I�hhH���ö�?�v�l��R%1p�(�u#aS���$��)��"��9����]ǝ��]w�D5�����=�ZU����AFr&���ڣ�[�j�����O5��Jכ_�_�O�B��"��8��T@�ξj���<͐�.�<��EmU��O����r�Ȏ%g���d�c�l�[OYhһM�iC�D�cv���w5�t�yG�)�ʨ��͗?7�E�^��"	�?`8�q���A��+a��=���<�q.6ҏ�5��T�Ϡ�w��n������G�n3����9?��k��P�����~�w���~�C����]���q˿nر��o�~���X�/6�;Km�ֿ��\�q���7z��̼_�� b=�S���!���)����FV�v��2�62h�`�U���.���ʞ�=1�̡���jh��)�_�@������ �v���2���Ӥ,���O��s�֯�+���� ;�u��z��j/"KoT�T�:�K�pêZ�sQ&J*�7ŚK�Օ�S�}�4Ve�jU��t;"�h/U)� ���HKٖM�/5b��ܪ+����z}zt_�Wz��OH�򤏯���!�yo4`���+���o�"͚�j��C�\VTE�-��6߭�xEH
����������YQ���"»�o�zk�ҲD�Ϛ��!����K�OE�>:����4�z�"���3Gi�(Y�gQ�p�M��3MJq�ل6�hV���.��7xV�^Y��m�d�*&�L���S��ؑ���ik�Foq)���!J���TYB)�]�<����YS[Q��o��zL���n%r�_�tƬ�*oQ0��$^��_1A��Vϕf���^oS���2m�&�hq7qŸ�%f=���Ow���U`|��B�"�v����*��1�LZY�k��&m*��G�"-n7���K�������i6u��d:K�φ��ևM}t�{lY�e�u"`U�������O��>[���@�j��U��zW��6h��%��"_R�몮2ʺ� ��͒�yI����w�#��	ކ͎�$P��D����e�������C�Jd_sJ�<�=;�Rj���}�&`��4�""����4�KO�;�V��,ʗ5)��u3yPG�i3q��Bמڡј	� �  �Ov!틝y��:��R	[���T�@�jR	D�HЛ_]�@(5Ȱ(,�騰5Ȱ��uDtD<��\�^�z��E��a�Xכ`�}�@�#%#�O��X[��N�w �8��X�M�&0�@
9���v�=@�kij�7�:�)�zk���*�OEV�Eɶ�հ7:�o��C�c
���`0���Q�'��5�5�uZ��_Z�G�m4���@��es&,"A}��_������]}TG5->bT���:��"��ڷG��s����"�Ԭ͚��9=��Jg�ԁ�i~������ʹ�+�j媂�lQ_~�8�ɿT/]@��Q��rQ��(�Z�S��|�WCu�7ƍa Z��b� ^� �c����n���N��Q mkb����L����7Í@�ѹ`~u+����	a�F�=���S�$��أ5HnN����Ϧc�m�z�&eO�k��ix���6��d����<E9fwp���y�4�r�Eˉ�Z#��X�C�ظ<�h����0���١�qة߅k�ᰫ�R�A.�":X ͨ���}/��z8�ض�h��rm�n�Oy$
(^�%��Dg#�\TtI�t�ENd�.�:G
���r�ϟ㺤d�P�'��0�M��n������� E=�+      �   �  x�}�۱�0D��*\ �!^|Ւ��Ȃ��H����c � !N�g��I��w��"�Ҧ�T#I��m���N��?�,��c�L��a�g.LM<n�pAӕ~�!�U�D�Ҩ/�#�@��h|�� Dy|��W�E(.�Ns@��K���@��)��u��-vg�cm� �$85K��a�*zD\!���^�py��b�nSPI?�s�(|m�Z@H}1/�A ~�-���H���տ�D��z(����5L�SA؇�'),�d�3�2Ub�d$� 0���$�;�q¼��L���N��,S��Һ��A�XAn�aVMf�C��o!����7��l���G$*���V�`��&BA
�z֑��(�v��JH�[Qq 4�q�+_��N�&7���>B"����F՚k;!#�=/H�#����!ܣ?#hy�m�E��[�}9���p��G���Zz�(c%b9�@�D�1� �����D'�;�O���$��"4(tm�<F_�q��*���@��7�%kMH�Q��P���{h95���S����=x�[������DETK��!y�Ď���H�Sx0&T�C�GD��� ��R�%x8Z��1ևA�*��g������a`��X���ԝ�=�0y0�������`X��`0T��/"�;��      o      x���rǶ.��~�<<w�-�@�5`�eIM���"e����(T%�
U� B�������q�[����&�Iz���5  Eɲ6-�-QD�*+�5�Z_�{�?q������?�zC���{��`0l��؛g�������h��Տ���"Z���uO�'n�NS7��%����4�/s�ʅ����?Z�����Ư?�:7}����,�,����F�ߛ��=Y��?�?��⾽�5N����gk��,�#�`��~����={����g��c�}��3�72��݅������,۰fvG�����w8�{{����7V��M�+?|{�|�A�V�J˄�2k0��Q��_�U�`Vd:��v� �:&�W�V�e�����麘��_�x;���r�v\��>֡avp�kd6ƪ^��:�ڋ��qz{/��3��p���q��ם�,g|⻓�t9�0O�i�R���<�%�&��ū)�C݂���Մt�2�.3��/�W�aF�9ٽ��Uq`Vp{�tɝ������V���=��c�qz����N��ι9��n���M��Nׄ��ͻ,{d�Яaגw�;�9��]�s�	]ow��7m�OL�7�J{�3�&A
�'9�#2��l���g� �*N�,��u\�,��g�d���Iy�����^��4gQ�s����	���ǳ�yn�� f�&�VR���ظ�ٔG<u�p�&qƫ�e�"ݔM���a��^���?�kEƩ���tơ�O�0��$�/^ǩ�"�׊M�T��狘�����A�&�����/���%X$q���xA�� ��Ʊ����2e�;�au��=�K.���Q䒎S�:@�q���%Iâ�{�qº�)��ŏ,�� '�l�F027��h��I0�~3/t���~� *c��F���>��u����?�����������S��޽�Y�'��C�i�N�m�-�ہ90K��Q��O�>�A8�~�l'�9������8K�"m~��i���	��P��i
+�F����n*o@Z��	(�D�UʽxD��=_"�4޺r3��,O�����/.�P�%����M�wx��~�V/���Q���:�K���R �� �-8�8�I;��"_$�8Ηq�L��w�F����?�c�)���0l3�czuՋ���8���X�[��R>k����V�6�rv��ކ�O��Ǣ㇯���!:o�yаoX]�xYD�q��}7xvس:��e������Aڠu�q֬N����ͽ��D��ܔ�	
Px �/�-0��:ŜA��R��yb.�Y�X5Ǫ�,Z0"�ï����1|	Sn[pO8aL��RO�a�l" ��3#�7�:WR3[���S ^�<�"�($�������$
�.,�� �SCӒ�mqFd�nL��9�?�$etϙ�7�.���[��8�~gXV���2cgE���5�;�y�c�=�7�j��ǌ�i0��$��9���9�Z�=�|.�p�~�i�2P")N1M��h��ōW8��Q�.0mcب�'H`�Ǳ�|�����z����MQ@!I���d�@��1���������K�G zr���{g���b���8 ����Z�03�3 qv	���.ބ=�Q�Aǆ��hf\r.L*�7��P�D�r�h6��+)_�6�fG��B�J��8�!������˴��v�+Ҕ�4%ɘb�DG��EQ�k��C�r�E�1�3�lȟ5U0�S$�V>S�u$N��t*�/$�+J��cA%)�,9�JxA{�e��e>�haǲ����f�$��b:c/ݷn#�@#��ˀ>�\}��J��j?1]51��/�`I	�����nt-8�2;$[����&�$�.g/�q%t?�2P�8mMR��dà�jh�3��h�fH�
)#���8�.h��� �h Dʓ'/Y�����R5�4J����s�<��wM7�!���UH���0�%q�D�pCtа�D\1T�ن5��^-Fz���t��T�sגBI������Ǫ����ͫ��X����@��~+�Wi))�-�A�&㌜XO1ajŹ���5ʹ��#m��%��^d{�7���ЯX7?��#�D�n�Q�t���C��V-��zێ�cAjң����8��"�@u`}�z��""��	mo��"M%.�"�R�]k�zש�����l�6{�M��c��K/��;���m~!������!�k�VZ~5���Fv:6d�Pˠfk�GMd���LJ����J��.i�LGAL��jv�38Gd&���u�m��0P�D���K��2X�~ݔ-�	�
z0��{�-P�S�|�æ�Mw(�Le��Bp�3ꘛq�������<���G`���q�yj�/2��x��zgd���0�o��:V�\�������z�2~0q�z�vطl����h�{����q���ŧDk�Ӈ���'˟�����=9	B��i�~L��t�t��������V�y4I�������
o�rt��
��q�"����_7�����F�=r�5z�0e���Z8ФЏca4��\���}3�Z �3 �ө-Е��7���I�C?��b���'��!��]������ՠ���;Z��M3���|�l�#W�qC���+����m��|�5�p���p��j���d9��0��K/�g�l6�L'{���[z��}1�Mn4{��;�3;���1�ޮočв[�ø<[>�!�^�7���e�$;ڛ��	��J&�있�o퍘�Mʟ��@^��oll��܄� ����MH��͔�;�; I�M:��G��`j^݈t��O؆��^=4�"�k�v6]｝{o���|6����Ck����G����<y�?7o4 ��i]5y���ϋ��;�z|�]$Эg��lk��������ҽ~^�2
K��Ԭ|/���pm/�b���;9O�����G�,�9�����k���kΞū�� 0(�o`�����ٶ��#`�Ao0��}[;G!��C_���N�*ō��Pt�1L���)��4��g�Ή�Y8�/-r1�{���g0g5{�����,�Z���a*�K�	�1��z�ddr�|�1b�Fv�J��g�ݞ$N
ܟ���*���T���$��
�4�7�����{����%[�Ų�H�S�I��K=��O���.t�U���.;]�.�P(*�`JѼ�0@�V���iJ�+�,hp��b�(݋T:se#� 5����'O��_l�U�4 �:�G�r��0.�r=��\<��;���No���Q �V�7�����P1�߈��ܓa�8�ܬ�iR�� # ���1��9�d+��\�X���m�'�Q�i\�|�;EY�˂�$g��Tl��3VI��J|1[�E�.�+\�z���T�,�HN@�Ѱ�e�[�u���o�E{�xK���@����a����*&�A����&GIG1��Ӥ|pt/7��I�"."��N�7���m�sG+7�w9�3����ޏQ��~��!\�r�o4V�H����X�|1��a�6��Ir�2L���<�96�v�O���UƮ/O^M�`"�B�2x�oN]#b4N]�1�;
-e/�!�h9<y��­�Uk����$���|#;���h{.��o���E����&*vi����/	�;�
^/�"��h[y���ikTl�Ϫ/�YZ$����$'��[!�G>m�bP���d�FS܉/0f��;.��_sw�#�}�X0�����G��˨����i�T�L��Î@�<����kCĝ�5Ȇ��jxȰ@�A�.�i���@�&EH�1/���&�I��l9vP��)с��¸��т=���$_���HS>p�}���AKL���=�J�[���24��+B�1��F���MS��Əap���bD����&�n����ӧw�g0%0QK~ �k��b3D�_�V�F���Qq�@�KN�͇md�5_���������c�-.�4L��R�6    �<\�gڸ�"�+\��G�Q�/SD՘��F	&�]m^l�|��ްK�������� iD�3�`��&?�a�#Mza�c�%O��d�W~�yiA�ڌI92>�M>�v�@цqdY�V��,dx4��R�a���">	�E|2}��lQd�]�{Z��-)��{�"}��(fy�����ha��_�
כck��E��&qC��Riz�RM8)��+0�ܐN��6{N�R�V�+��8B��5u�.(]a��8�=L^�V.�В2�� �\H��:�-`22j�X�J�:eP�1�Ob�&]��4X�����*������@���<S��(�U��Md�zJW/b��ϕ�&L�~(N�_Q�f��5�#IU�+4-��8r�b�CP�𴐑YK����Xn�&/�p�a��U/��採�]��@$�N��@�$5#ģ��P�����+ڣyA3V#���{`�#��3� ��ϲ4��Hy[F�6b�e;��v�m��~�Q���@��~Zu�]T	���~��q�?�:={2t��ݛ8�!x�}��m��{�^gPY*؄qz
�䎑�vJkG��?7��� ���f�hR	ͱ��ѳ�d�1h�{G?=89z����Ag�<v��|>{}� �����͏Ó��n������lztt�e����������<x4\���+w:�>�<===ɏN���3���{tv:v�������?����|z�槧��:�?����z���E�fh��^���h��)�3��V֯�G�Z�Dݬ��G3�??[�d����|9�������t�~}��q����ݣG���:z��:X������$�������Yq4���Q��iiMb�b�u��??>x��?�Z���z�/ߜ���g�����_����.(�ӇϞ�?)N���ed�z�����Σ��룗y���_Fc�i�瞽x?N���g��V��]<9]�_�_-��˳�e|<�L��0>���'����so��1�w)O�v{���	���v���;(���/O^����ե��|����ţޛ�n�;;a�+��g�_�|��_N^�9�&��ut�����A����wav���q���Oy㼷���~г߾��������w�����dM���5���?�<~��q�����?=�:��\�������_�/�;?u��^p�b�\��"0�����iz�q߿<��w��C�G����>I�����?y���'���wы�o^<�/�����`�b����<��5xtq�n��<|�������Kn��_^�g��ׯ�dz<��G<~?���<|�Y��x�_翞<q����?���~��5�����rr��u���O�g������o���/_/���97ܹ^LW�Ƌ`r<]�[��\��,����Y1w�ϲ����e~�z��_/�?��$������y��w��Lq���U������ۓ����~���s�EE�hu�����������/����'������7��'��i/�<z��{Ń�o�=~����<������ɹ��zy�����u.����/5�q�30�6d
�-�����k�ER��9t����e:�C���tm��0�����z�41�y�L���v��(�Byg:d䍃v.�Q0kO��a��Xԋ�'����;�Z J	wtP��u�@S!ܜ���L�/��L�|6���ȴY��E�L���t:�[�6n:�Q��6�CJ/���=t���]�nd8#v� #7M'Sq�U:�cD�@T�.Y�Y₆~�0���M�L��㐖ف�q��2�1�V境nZ$�g��]�=�{��@�cL�p�4	嘓�6�0��.���3�(ɉμ c`�޽`J�qeF<'�M���4�'�k3c(�{�!*�4a�u�I��b��C��1zѱ�z8 Y��"�Ik���a(h1Hr�������01������l6_[�J��[�)�^���w�F�p2�h!J�BO�m�mb�2x�K��_���"fy�� �/]a���-<s�k0N�m�RiUb��45�~��=�2۟�ݒ�S�C��q���S���PSa���V�`bU'z��h�F:M]_��3pb��C�e��R[�5��_��Ù��T˘ȴH0�,����y<.ýXr�"L5�F�`�g�E�Rܑ�iB��B�Ut�`Z`�r���E:�+���br�Z��0m3��L�N�/Ҳ�~�Ԓ�J1��R� �&n!(F�l�nkpX�zc!��
���_�O�l1'�@����ͮ��9����6��,����wG�cq���z��&�aR�\CpS�U�x�3�# &_aI˚�K�s]`UG��-�"I7/pP�r�%q/�1:v�}�V���f��0�RP}NS��e�,�F���S���	�+r(�mZ�|���0���/�t�y� ��c��U"D9��M>:�TU�a����<�pXAzr�
�Z$��^8[�)�#◗k���E�n�(�0Æ��|�l~�0(��C��q]�Z�����!E�3�ے8��Tf,���N%�����R�2�
�-�j�,f ��qr�k�~��bi�2�'!t�DaI7��"��a�fq���Rb�����U�Wv�\U����$Y��H|��2O:�iD�J��"��]�T,�Y�3�
���3�y�7S4M:H���#���b��~�K_����ݧ��T2&U���*��V䊕���~��佗�z�r@�gI�G쟃y
3tt0Vj�]��)։��v�Lzu(��"	-�:(0���(��2��apFϾT��ө���;[��eO�v».���W:xwO�P������µ��,���W�Ҭ���46�|F��Q�Gf���A��&�����h�P������8��,Nܻ�B��,��2`G��Xo�b]Tr��mSጠ Ř�R���Q(��F+	�RÚ2
֐Dэ�p�C�ɨ ��rL����S�|��rg$�F]�2�`�"��q��ޗ��P��͎�d�	��-z��o������J���"���cQ��y��&pCTB��5ظL��q*�j�6)cb�KԈsGQ�������-���>����������_!Y��t�\f���a�P���l�Lf�F0��zVFw�/����Lf,DbO�������%U��L.,�:U��*h�2U���� O�q!����)�� ����0R�wM�*ޝ��BL�д�:	���S�n�'�!� �D�%YL�x��4K%i)UE���0A�3^�=����$�J�$�S����XI�{�����6@�Ȁ+7m�c��H�rZ�����s�+)��ehO�Si�c݄�Y�F+ҫ����	����fH�#e�i�� ��HS���t��w.����K&<Ҋ��Vף�RE)�TS�8���">� ���*+�4��� M9(�pm�,AH�	��&p/wwh���YHLX���Gbb��E�� �3�A!�ed>"���V
���@P�7\sb4w��X�wu�ȟI+��,�Ki�Lcw�G���o��ͱEt���Tb��Ӥ��j�������}���^�Z�"&kK
��_)8�N+��Jm-2�s �N�iL����4�ݲ�8������&�k]9kOQ�Qu�\]���F�v\99�DAK	m��!x:JҸiB�E�ZP�4aA	Q�����D([��j��RE������Jv�ކف�إ/%K�\��u&^��^W����2�h�q�����_y�6�d�3]Z�r��H�b���xYr&&���d*:�����yu���A��|�����C�QHj>�[N`��[�@{��$Y1u=&"��Hr��G0cN7�k�q��u�e�<�D�#�S��I�>[95.u�-p+~�ʨ�2-W�pQԋ6v�\:W��搃�-�H|%��CI�+����>d��E���CZ�!�ZEŦb���W@�B]�&����XJNEȥ��v�X�8AC
a�"�,w��    ��W�����4zH����(�%e7>�B�V����4�X�qCT,.��>iYa�Mr��V��6/LU
��S>`�`�g���Gk��3�-�#�J��.��;�[(g�<y��YÄ5���E�)�H�`����𣋱�ST��r���T(�(ua���~�K�|��������x��A�W�q����?	Bji3D�82fGD��B���<K��]N�t2[g�'�Q��$՚+�T�6fp�S�Q�r�U L����N�%n1��K�m��i0LD:M,�Zb��<�%S<�d/&;�F�D2��
�%�:T��a��`�D�%�+$�A�y�Ҙ���b�V0�h�����I��E�O���C�.�	��I����T-r�*X�LI��^��1��J���^�@(	��%7��Cr��IE~MLVw��X�䠾@�ݚ��		EV%�� /|B}㒭`�����"�.�N�'x��
%[�h�"���h'�OyL��D�w��-�B����d��c+"	V�J�"wp{�$��)�1J�Ŋٖ�1A�zh�Y=O�~	�*��#
2*E�!j3�A/�kT� }��#��m�
&`�!I-�������~,�aI�T����z�)���D�8��U��S�Rf*L���o�����ګ>d�W��R� �Wa�P�������!*l�&z0��Ep�Z�jbL7㸑-_JQ���dLD�$��*��&��ɰӋct7O����4�(AK�^���Ѕ"�ˎ�	f!O �T��MQ�nS������ٜQ��o��S��ю���L�:-3�p��e�z�Z^J��d�K��3s^e�c@T`R���ƅ/�B( &���Y)J5	&�� �UXE�1��F��gn�R�ù�ǋs�ae�:)��/�"j9�]k�{�� J���~�rEs-6E�%}|�M�l@͢���K�,�Md���ĺ@�g �*�n�>-A�P<m��6�8���,�8 �P�aVV1JR�	�*V���G�r��0h8#P ��D��di�Fe!���} ux.}�?��չ
{���\Kb���6�sJ�υ���r7D�;�3��s��A�C{����ށ�X;Q�M�C0!�q� ����D�6�;�rh0�����5���u��.�Y̶��סg����ND��r��L'A�����*_��-}O�ef��m�V��1V|<r���{���$fryw\֙蘦�t:�cw�-�~�S����:Yɥ�M�;-n�?��K#ރdɇ��ݪ�~���߃��0v�Q�'��	�֘�D	ף��+���s���G�7B���Dۉ�scFVF >�XG�nA\!3���$���-Bo7�]Qn,�y7�pb�Á�w�|���q�y��� 	����s7N^�Ⱦ��>����SW�\�%iȏ(O��]Z)�O�h�PI���sO��r�,F�m~+��o�z��X|Ѽ��}	0���w���9ME9�@C�
G)����g�P�������5�ɐ奊>w�����!�F�jC�knͫ�sZeW�}m�(Ű@�{w0��3H.������k�@0������f+0[�|:ͷ�|Ѡ�.�*Vb)l��2�l$Sq)��22tu_m9���w���'@cU�!Lic�E}#�4��Zc�%D�.!�/)��m�1t�<4f��(�]\ �->@(b�h�?}N����a�w���}�&�K=����3���Aj�M�#�e�M��fO���<��1wh��k#��D�*ì~�Us�}`RiA���v�n�.��ʊtV�&���1Pj��bk�����a���Ip�Q�V�)T���؟֤z�����W�����ѣ��m�=K���K�XQUMa:�)���ٝ��g����X��ж(���[��BK��4��r#(��2�k��E��x�T4)ᑥw���� ������B־�����]2��$*9W�2���:sj+�{��~t�M�Ev�~-
%�w�4ƍ%�a��`��\])���`�Wp��V�6���8���kh�^]�q�b���h������Z�i9�[�ܬ�� p��݄ە�}^1rI�f�|.��5.P�,��sp��1��L�� {2�UQ0��͔S��"�<k��8
j��E���(r�
s�d���@]�<[��(���Q���C�Δ#�Y�;�{���a�Ӟ��U�-mY�;.���J�s����"=����*�Â��Rfp�b��:��$���6m�lO1!�2�������W������`U(e�RU�DʈpoY�l|���ZO&X�@ �_��E"�]*Ř򩄣)pI}���E2<�Y"���*�^l�..0J�r��3my�]��x�_����"A��/�ʧ.�k��7dR��F\��=��Ɏ>|F�?��ǝh�=��ҖA��-�AO�v�i��Q1L�T��I� �f$n$F�Gn�Ǜߎ�w��K��K�}�P#�m�%����ˣ�*��1vݎ��!~:��|O.�vQ9ҹ�W�K.�_(�/����_�C7�>��?h�uA�gbg���mcC���f�h`�{������?|K�c��S���`7̥l9m,A�Ü
Z)��%��ù¨���I)���s��Eee�$V���4�4�Cx�>�fǗ��Mf���:&z�X�����0��V�b�a3�=�����=�̟�����m�w����	�<�~�cz&��x;�?�Km�lN��;C���1��{,���պ�����Ng�UY��~���1�=�?<x� nп6��=8q,�8��cN�96��,�ǆ�v��ޏ]Dom~��ƐU]��v�ۇ;z�W�6N�w�%���.��J���M6��v�W|��<�3<po��eI��`'�F.�_.[b��v�V��H�
�0S��Sx�ʞ2��"�1�Qm�*�
�/��Tx}8�c�TO�-Z�x��J��`E�������\Du|���ث��N�.|QnB���]<����ߺ_����@�bM���y	���fB3�mF%p��QJ�r�5��(&�y���I�zQ�^�c��"��O�N���u��`2�}��Zn)��"��e*?�sD��>�� ����q���b$���y�[��_ټ[�����_Ԣc��w_�HMRٰ���)�0�I9�c.�^DV���^Q�$�PA�2�<��6��X�`�
?L8	LuZ]�?�B�Jġ@�9�!|QQ>��$A���	�*ݽ�n��*�)���jB�Tp27#9�C��҂��dT�I��LV�N�L��U�G�Y�r\�S��R��0�i���^�e�� �n��n_�
��8=~�T�Z*��i�5|Y�3+��o=�
�l_�����v���[S����%ɹ�M0�RN�
�S��dü�ް���7\d;�r7�L�Ƥ�Go֎+&`�2�/OGZ3Q[+Nm%Tצ2n[�� �^e�B�@�!�q��T��7�nj�^Wm��}aE�1a���b!7M��n��Т��z����ب! +(E�a��?�Z���-��рդ��Ʃ��P�Q`?c	6K)����,��C��?�^���"3T��sh��&���{���qM��]�Ƈ}c�u�ݝ��t�ްW*��hK�T����;�dj�z�ݻ�l⪫p�,���S�O30�G����o,KWY*w�\���wsԱ�7F�Lȵ&�B��R~d[t�D�]�X9d�SU�ҭ'��@�����e�R�l�l�v�'��؍*v���Kq�=e[�J]A7$0�� ��I�B���P�Z�!U��ŝ��(*LW�u�N���|��$�*�w��$.��|��i*=�r�iP�����F� ~�@F-	m����΃����T�J������7Q�+a(DEYz��R�8��q>��d�Y7I�8�^�}
�[�ZXoE
=�[�0�W.U��a.Z�\ʚ�FgYH1�D�������l�f�KQ�r
:����檖Q����0�,9yކ8�f-m[[�OK���<�T!������7���a��JȠ`�R������*�j�%rT�XG0    *#�|�r�
��bA�ѯ����a\��|qf�G$�*���j�����K(�[�h�fF��U�;��_6�:[�9d�F��))�OP[M�L'>|�<�F��<	J
�:�7�Tp�	�F��&0/�'$��x^;��C�͑�KS�qi�6�N�lA�4��� �w�Ċ���+�;Д�ޤ�Y9']Q	^	T������O�щsA�0���Y��5������t���]��lw8�}��NJ��U����Z͸)�M�@4���E��C��qh	)�f�E�]�Mr�M�x	��y�4��LB"���D�{�^\��݉eؾ�bw,c�O��w}o��c�+��|sY\��َ�a��P�����2
te���a�z!���Z1�8��F�.?����Fh����*u��P��f�m���Yk6��|-�r��}��`(*3e����Cd��ջ!��l1۶�Ǖu�a�����;@�-��q�Y�"=U�,��Ӽ[�8�����cRqܥ~���h���b]d1��8���$�3b%$k�JwL!����>��q�ri�9�V���S�@w�����?�O��['�nLE1	ۼ`	V�ŇJ��W���;�;e����Aʿ������}۬���E%�ZW���4'��iֳ�x7e��o�c�3jA�-�ZYC���Å*e棘��1\Q���MC�֠�8Ŀu�TqD2b1�"�u��;}��R�����OM���{-Q������oi�ޜ�E��o����J���wo	o,�f�e��.�7�{W�����@<��a�wk�>����3I�tNS,���>�J��f��iD�������&�lc�B���r7�v� �T �&A�7�
���P��&a��6�aE���ր2>��������vJ�fp�"�h����0��?��U0�e�>�� {
��gc+ۤ���Y��X<Ő�<�t� ,��O>e7����Ѝ������d#����7��
�B��e���&�\�ߊʣ9������H������(�Km�MӛK���Id��C@6z1~�{bԣ��7���V6��J��f4�|^��o�_o,�͂�z�?4�xe��7�I�c:ҡ|�f�<��Ƚ ���Ϡ��+=C��)L����ϊ���k�ﹸ@/�oo~4�ğԚ�m����m��
;4;B����7��e6�>�֨��ñ:��ު<��EJ�1&i�#�Cp*�tj�2�?'S�Xc���[L[, Y�	k;����_?V���������*��PU�B�?�����D��� ��슐��8^�!�]������p���o24Av;b��g�92�#�j�������N�n����1�j��N�q��Ǫ���x��j��&��ޱ��w��q��u�Sv�B��� ��]���9�9��� ��t۝��m�������P~`�?�o�M����wz0=D�M+�Ǖ�z���?�?�;�!�|��n		�o��u����;��ه#���1���"�����	rp��Ψ�iw���9��2 ����,%Z���ÿ����r�֠���e��}?}�Ȁ�;&��vt�>�Fz��!Qw}e�{g�2�}��a�x|�%�6���py'	4�[�(,�������ıƵL��I�auZ��?�"�V~x�+��W>�藋S\�Dy�HXF��S�1�tF�8c��c�,��<Z����Q���z��}���#q	'�7uf�8t}bQ�8�G�Y��N�ft�zƲE4� !Q���y��=�4b����;�29��O%�>Z�c'��<:^)���%լ�T�M��sDGb(�sLpjF�=2�R8��R�$��>�/�h���[�F]��v���d���3�q�g��}[����4X���Rw��a���!L�.�"�`�|ӂ��dXm�8)�M�ݥk;�l��Iχ���08�ǿ�)��t-N�Osy�#ƈ
<�S�Xn>�o�g����L�[rp�0W ;N���N�EQG�N{u Q�����C"ָ���U��b^��V]q��+��h�
�bl��3�;�s�O5t�S�'*�C�e�1��E'1W�2rw�nN4�#��q���i<*�����~��Q�[Vgn�#�\O؀(H��l���P ӹ�x"�Z�Vg'��5֩�ă6�=rL0N�[?]�F]sd9`#8��_���;Pq�l�����F��4_O�ْͣb=���og��y+b ��og���/=y��^��z�Χ�h�Z���Ǣ��SΆ�U��6��Wij��$O"�uz{�t:��3��>��p�޷
[Z���]p�_d�<Jy�Z�*�ڕ ������+��c��n���2�u]��BӮBBS�y"J����u5��v��K��q�����_�5�ڼ��RL�޸J.յi��f�K���A�>g� �q��D���+�+巉�D|;.B0t�Y��q7�7�����l�C
UZ<�j��d�b +m�d����V_m����S_����q�_w�?�X[9P��WW�V�Y�?˯�־W�6���x\��4#_܈E�=���q��B>��Bo��K�dYW�|D?*����8��DQi|i��)�n�W~�.�n��IUit!��Dj�w*����QCd�D�9pK�� Ѿ��J��.y�Rrڰs�I[�:����_�l�J}!߼`X���@�n�Fxn��V�Q\/�oXX����V�|KVnsM��k�A��� ��j�@� �aY伜�Ò���G)_��Ze��W��|���Mzx5�w������h�.�qtTJ���m�j,uQ!�ܭ�J��r�)���¥Z�����d/�\�?ܝ���qs��WW�����+�`�)��a'�m���+��7����޹^�F����ە���N�7�~50�Pd�
.�JNK����jTo0�Bز�vh����q��_�[�7nh�)3�3�N�v���/��H푡���"=�W�y̨����%�ڑ0��8Ϻrg�&��;�8Πw�,�HB�m-������ޮ��B�K��HAN��U��#h
�+��E��JO\�\���y�z3�r��K�~[%�qò�N���K'�'2��/���jĵ���շS�F����w�������|?�4�ԫR�$���9�<��xۋ�0H�nY$xb]vh��}h�e"�J�C��i ��!7���0]c���~:�a�?�l��Z���p��mu���?�=Ӽt�z ��z |r�R��B���e�v��;Ȁ����TL���\0`�%t�>�3���>|�g��@�����"ob;y�i�]��b0D(��X���V����F+�����>��`���(��1̠��d����Bu�����!g�!J�jV��mCIÎ�3@�}��<�f7	N�`�.�����q����~xQo��4N��=��#*d�Ev�h�l�^�\����^m���b[<\7�#����r����z=��䡘��E0�ƢHSw}�� � ���"A=�.�b��7$��{��6���׵�Z���t��:(��Z7�S��{J����_ŝ�gy��Wŝ�C����g����=�����#��S&����C>N��-���6q��t�]{~�WD�tR��@�0�E&��ߩ�߇D���m��z]Փ�Z���t@U�K�l�:�q��ӍI�7`�!O�t]z�������_}��˯6N�`��F�
����̩��&!Z���ܞNB��k������$D)��MB$,Vo9_�9�v���(�_ EQ�䟘��<k�t����J�KQ��^	���ns��.&�])������N��ƻ5Y�ǋ�S�괗[,2��mI{��������I;;u&��6wj#x[$@��ec��`d�~KV�y�=x�%�1v��**�u�˘�}G7�X�ө$̑"I�_��/��+�X�-�y���O�����eÛT�;����y³<��]O_�xbd��A�}8|�֭�-�$vdw����͢?���fz�p��ŵ�7�C�    ����OW�
p�h�DO �n�B���]���ya�W�jt��3d/Sb+�9�;�r�v!�|m9�IC�;M��� �5�3$_��55�:j�g �|���`41�:bTKt%H�o��ڃ�ݱ>.�SJGt�@G>1z ���Bew������b���-_|���Wt����q��U��|A�m��/'q�,~�t�(�1�L;̐�^�c<�~���pp>N�9��a�$�X�[Ug/�s��������� �%�6�ld��ԋb<_�:e��Ӷ�9�Lhe,E�w	��!��j�QxA��hx]�+%���Z�?�d��`�ϙ�p$��%x�ڤ'��Ʉ�67c+�,���
���S����~���'�PT�Q#,2`:���u[e�Tk+@q��l�r7�� �a�Nr9R�}=���s���FOǹ�f.h�Ϫ��Ұ�@��UGG��
1�|���i��[��������C���X7 X;`�$�k��}���i-W�|��k2$���EAIy�+��6;����Ӕ���~�"�@��q�x(:��O������5��	�dN o�u�0����q ׂ52�"����|툯�)E3�~�麾Ox�x�9���b\
q��W)V�j�J����~�1���"�E�'���8�U"��&��g( �y���)jƷ�a����Q��Ĳ�H"&'�}��:�V�R'�P,H�.t����$IC0�C��� Ac��1 A��,3��Y����Hy��,<�@f�b,tz:�ѡE�fh�##W�hT':�|���"	A��k��\�"��>^�8p�67�ΐ�3!��j��"*A!��٨�vV�����'A�[��}(y�q�3��9����:�#���)ay�r���/(���XRZ��Ty�(OA� \(H�U�5(��*���I��5�f�?�j
������E�n�PO\	z
�*���tIę���C#�0]�b��x��)$��I/�}xq,�����̘cAB|1��!H�_^�Wn�`�y4g:
�"�����J��Qz��h�A�G��9������o��d,N'{	+̎i�������g����Ն��Cw�h;cY@�a����~�X��C�UJ)�lb�	�t2_!��$Z�Gc D8�KI��m,�>���nr:���\x,���ݬb߬Y�Z�����lԥ73yxjs�0D.S�<�� �s�=�*�u��>�����7��<�WX���(�f�4.`9��#m�u<�:� a��#gXA�6����Md�+�$��BU_]l�2��D�;�E����f۲�ڱ���7� ����j���ğL���{�D(~�72�#�/-B��1�O8a�Ix���tڎ�	���/�숎P�M���ӂ?]��jk�	̺<:�%��2��Ŏq��ѥ�1B(��8��4��թ:��1�hN`�Gi��u�}����!�x�,ⷁz���ߝ��87��5p�-�'o�x�>�xT	�F>�[�}���Ct��}�0d'�2&�齅�E���$���wo������*ԏ��`�ݰ�N&�e$���Ei����"�4@�2���E�u�G���-]��6��pvxs��-T�*0��]����Q䆥�^A<�a��w�K���I�
�+n��h��.Em�Ԓ�R�G�s�:�:BĞ:p7�q0��b����o�%�5�>e�g0�{Yv+�Ĳ:���3�Kcq:�fػ��}�q��zX�&��D]���G��#h5�����|-'tΠ���#����Zlk�����|}>�>A����G��#����g�����|}>�>A����G��#��n=a�����|}>�v�u�NB�I��|��1EQ����ğ(EQ����G�"Co���}>�-�x��#��4����\��#h��U��G��x{�Q�������>AGt��k������|}>�>A����G��#�����|��KP�|}>�-9��u>�`Ե`���k�}�k�:��80�ci�X�9�:G[�hk�X�Հ���@�(V�	�y�7O5P���@�Zlk����(V�j�X��b5P���VԟŊ�@�(V�j�X��b5P�������b5P���@�ڱ�I�:	Q'!j�X���NQ�@��7EQ�j��7lncڋ��@�(V�~E�s(V�"H����P����xk�Q��聎|m���b5P���@�(V�j�X��b5P��%(��bo	P��(�?2	�ߟ�\Xkd�n	.��qau�K�d�l���qa5.�V:�Z��j\X-'�^��+ո�V��j����Jlk\X��qa5.�ƅո�V[Q+J��j\X��qa5.�ƅո����ƅո�V��j�Z'!�$D���qa5.�V:EQ����E��E�ް��i/V��j\X��a�i\XM��� 5.����C�V�!F���:z�E4.�ƅո�V��j\X��qa5.�ƅո����4.�ƅ�ݸ���n\���tF�}Kpa�[��V�t*�N�֩�V��j5���5��l��`���{��l�T���	�`5���Z �6��]5��Fv�Ȯ�U#�jdWmE�Y�(�쪑]5��Fv�Ȯ�U#�jd�[O��U#�jdW��k�N��	u:�Fv�ȮZI�dC��z{�5��z��6��hdW�쪑]5��W���]5A�*��Ȯ�o5jdWM���5�������=�Ȯ�U#�jdW�쪑]5��Fv�Ȯ�U#��^��Ȯ���ih���jmA�vFVw��"z��lw�i������m�2�;r����g���^{�jn��>�k�W�Y�:K[gik�W��Հ��֠��w�}�rBo�޲�S��' }�r�)��8^�1;L-0�ؑ�Fh�X-��ؾmb[C�j�X��b5T����P�ڊ��XQ*VC�j�X��b5T����P���05T����P�*V;�:	Q'!�$D��b���)�*���(j�X-2��mL{�P�*VC�j�د~NC�j��U��b55�j�P��o1j�X=�у�-z��b5T����P�*VC�j�X��b5T�������b?*V#�~�Xg��:N)�:��
���?)����3�8�:�S�u��N��8�'V����qb5N��z�T�j�X��qb���b�%�5N�Ɖ�8�'V��j�X����?��qb5N�Ɖ�8�'V��j�X�{�	S��j�X��qb�c��u�NB�8�'V+	���qboo��Ɖ�"Co��ƴ��qb5N�Ɖ����4N�&�[E�'VS���F������Ɖ��=�ڢ'V��j�X��qb5N�Ɖ�8�'V��j���KP'V����X{N�3Y�:N�5d�9r:�NwN�`䘷'�k�=t���:{�┰~��P�R�����f�of�!�~ͤ�l��꯹>����^��0vsA�_<�U���2Z��X�{p�	�	&8.C�J��_0m0L/��~L�� �o6+�#`l�9g�,����oZ��/9E�7/k�ghJBk�ф��p��	�~�D����`@y���N���zgL�4S�{[� ݆��zB�����)��GW,���.��Ѹ@���_�l�H���ޏSr�\�w��W���qS��a:�XJyѹ��=%8# �Z��Q]-�0(9��8
��l�Q!�( E�+��i�CU�*5�?�T����bp�)`~sl�o��Q�tE'I��*��1���:'`(!YN�|��@����Ș���!��s|r�����Š)������Љq1)p�Y�� x�VN �D���ˊ��>\��B�����0�V�,� ��q��8T&Q�o�K`��bz�kdk�bV�ެ��c=���wՈ���4��l�Q�(.0�2'��.+�	K�Hך�4�Q��x
�ap��7Xo(�M���[-�za:��nF����|�1Z���f���*�ϳ9rz�@Ҳè�X������.H=6��*�������Rc5��6{    z�o4��U�/�����B���$��;�,��e\]��؉2(�/l%�qp��eVo�tG��8�A\����7ؽy��i���V��=����ﷻf�jy+Y֎�t�����y��a<5�5�F/ɮ;���;&v�$��G}	s/��u�����z]���c��k����N�_s	:v����3�{�����Cw	^&���P<(G��=��Egd��������4w����h/�N׶�ΎnÜ��mA�����T�w滳w����a8�@\�=$1�+�H18Q䞇
�S$�g�Q;����շ�r����T*�����B~��.�����1��!}�<�[�X���T�@{u
��߭4��b�7T/�0P����q�N���M�3Oaa��?�tŧ�w�5�x����Rd!]j���+��nƧ1gE >���Rl���)�Z�ո���N`-�I=�1��xQO�g�@�:X�����>��`RW~�/_����;���j��u�(�)�#EQJ����M��@���S��u��$�ni�S�[���d\R_>bP��~C6{s^~pR�������Q	F"ס��k����k7�^�8e��]P��]l�k����<ʖ2Ѓ�3Qwy�8*�6�c"8�c��Of�3	(Gv���H���$c宁�����ă �2�G�qAx� ����ʠ���2����|=8���)����e(�� +h]�KqwC`jM�U�V�맅��${Dm���a�)a �o4�]����n2[�ƞW�� 5��.{��T&"�h��{3��,@���˳����ߜ��a|/\��t\L�v�p��4��:���"�����C`.2O�aS�.�?g��2��)�)�+4C^�#�ՄǸ�"|#x��l��DmP��!i��zi$�큫�������eq$�>���]X�U�@�`~�$�g��@ޗVd�`o��L�1|2����A�e�L�}�܊7��kZ�_S��R�TYv_������gPj�K���}��꜌�S�4�cvsoNd�2A'>��(��S��|�Q�#��� &%D��E�����#fI��EN�?���L�x	2w�b\0qtMȰ���o%�l��3Սx��B�z)l�LL����3k��X��D�8R?�H~'1��(�`���&O�E
���s�QTTX�j�)���@����S��ι7����kv����=�[��n�.��p�<��q:=D���6�١e�C���-�兿��6��U-�Yg��C|����u>+�S^���D�DjĽ�]q1��k,��ugF�C��d1IA��a�d�mp;9c����A�UsMme�����c���8��]���:AV6^���ޔ���]H
�#Y�bV��Uv����0��gq�xxT����t���2�zU�tC�Ȉ�4@P\
�z!��\A �ҩ���Ɠ��z)p0f"G�qM)ؽI�����ࢻ�w/�[�v��]�D�&�JC�w{"u*u��̤*p��E���S���7މ;�4E}����`8���t�/1��)���Ĭ�~��	��E�J�,��->����w�I�.Bc���V�0狃�Ec5^�q&�Sl�mhm<LPĆP�*�uF�#e��C�	H�W<$�\cy3�L(Ŝ�b4Y�#r�o���
�A�(�y�tx��(�(�E<"f��~	$�d��0)� S�@�)H=B«�Ly3a�
3����&��t¼����>��|�V�m��4��T�%ϊq���G%�T˔�o���Aj�`0վ0�'��u6u�b �
�:�����,���`���7K@�V��E Ru�V�$��c�H=*���Ņ����<���~�$
@�����ɻ'�^'��L��h;EgWJ9�vw;�L�j<�i.h����30ޏ*7�1&�I��L:�Y�p��2n���Rwj#�~�)w/����.��Z�m�&�=��{���V(���.�4��]�� !	Eg���t�
à��]6]�1�	|��B�׻`�Z�V�P#?��F%���8��� �K���ee��C�|�8v�-��SN���H�lO�E��Sʂ�$��đ�M������:JiR�s �tuA>���a$2Y-�1����(�;��;N`�<��R�6F���Y�q�S61�"��W����Ԇ�amu�(��e��"�ڊ�Z.q~�������BV��J�e/���M��9`;�J+����T�
�j����M�x]��(�H�tI��{nB�3�6�lxJX�;�%���Nbl����vK�ayio��u��_=�(�]�D��%Q:zí�������L*���n�t��V�v�`=ۡ�K3h~u���n0�?چ�H��v�\6K��`:�]�2q���u�G�S��Ѧ����6F;��N���n���s6w=�d�7o�[\ť�eu�ß���=8gI��p����I>����%���	�X�8�}b�2�.�ĊZp��1�L߳32�)�D�X�sU�h^˚VQ�K��A0	��0��5���"�L/AC�"}B���ba���`�8Z��ْ3���ezq@f���i����Pm�U�UAϑ�ζȨ��^�i��J�CcN��#���J�s��GV�A^df�ɰh�33ۘVB>|/�.̫�7�7K1���@��ɍ1u7��i�O�����
�S�I�Aa���f�!M�B��CRA��������"��1�b��~�X(qi����[�
w�gB���&��jo�zZ��L{dw�Y��32;/[�zu��c��7U;���[���I����`�1��\E
K��*��j��6��f�����$O�b��JH�V���=�2��`3�?��;0�vo�P�'��z���;��\����;���� �,��ğ�3��o2�?�ڰ ۉ��=���m;;ƅ�:�������z���lmh̴z֛��<\�92{m��k&���ؽ=��r�:*ܟM������h>���7[�yT������,z;oEL}��k߿��V{��:�.�1k-�����Z4O0N5O�aنM	ɝ�Hۭ���0S���i�I��7���
q$%u�G�q6銦�c�:;V/�N}6w�>�$��>Ǧ���v���������ʪ���8��PƢ47��+��aio���1�ͼ�>rEw�|]^�}m�u|Ml�#]����U�:�:��a����3ؓ�{D][\W�0���#,i^3
g�:�`�� �ể��g�%=���������%�ID�0&Í^첉�8>�)v���߰��?�����8H9�w&��&[�$"���>{��b�(�G�^����B ���ZL�=�a�<��]����"��������}A�ה�O��%T��5?LW��;���K�e����L��H�u��$-�����`�����iJٜ��Rmm�B�}S<�ł�a��+4����͙"�`�$�$��L\���)�j�S�B����vX�V0½c[�s`p@�f�� �Wwo!Cn���͖�]M��+�U��zq��q�b��Wޱ3W#�g�L�-h��Qp4}��!&��kL��?��?ؾӎ���Q�t�w�B�'��b�H�:�8�k��<�A�������?�$1�!6���Ҋ9��M.��
,���z���D��>��%J�5e��ʏ��Sq�KN�{�� ���Ώ�/_(���ڀ�*����5s���,�ܐ��I��E�i��+Ǘ�rV�ˊ	�T���+K1����(�}H�C/A1O��XEr��q�z�VZi|�q��UQ~�ΔY�V)�	�%�I&�aMl�M��
/H��eE?;��t�`�p� �Ч���X� ݠr��(�LT����-0ոJ�I*�/k���څI����mٟ��ˌ�+-bv��%&v��j��"R�l�4k�jS'�a��HH"}E���d�0+�@������iÆ�rOT��S̤Ca=�I�    a"�(���C�R\r���j�Q��}�d͇0m���OY��
�(E�4���j��j�uA;He�kK0<8.�Я`�S�>�EZ �K-���T�x��h�爯��aTZ%��� �N�J�WNeA�t �m�F#�Za�����[���%U�Oh��hK�� 3��D�%r!�A.+�pww�y3_a>�{S=W��g���h���\�\e����aCmvJ�'`�f+ދ"<R�0u����5�k��+�dB{6[\S2=��¤5�6$� ����A�,Jܧ1�r�j1�6�p��^ZЮ"LSC�m�jѡEǦ�8|/��b|�R��R�9�ߞ=zN��H�Ar�/^�4�dMMԠ�E}p�z�X[Tz�d�u�!��Z'ݬ�Fn��%�X|�K�~e�TQ.���QO����y�`�  �n��Q����mv���XB��i�X�s*̶�x�&�I�ǲ�[��Ƙ3��Ed�%�	'K�ԃ��j���
AfQ[�X	��.��D/��h���$l��:�e�/Y*ϼ�,0��$�\B+)C%t�wh3��!8c�F�Dyi:�+
�(��-+�R��-���t���Am��h�͈5=�X��θ<�X�B���N������R�CpiA�k	�$���K���ȰrJ�&�h��s�ı��yBނ���3�SwE�G*�_�n�T��
���Z�!�e`��a1SI�S����*�c4Od�#c���8������6�,���STkz�f,  II\�;d}�J�
�ӎ���#�J e�������z�${Ͻ�YY (QjK �Q[X���ʼ���=��TzS��r@��]�5C�Δ����RœL��8�����b����N�_��>�Sդ�ޏ�����CW�%[VZc��Љ����D~��v����nq��d�P��ұ����_Dˉf����C+��q�������p`	=�� ��	��hL?,�8j)�������Q��m.;OZ±���B�6;ê}J�=�_���&擡ۡ�S�z�ȫE?�\��82	�Ῐ���}{�@G2��:�|aUsp�Y>m�������06��W�c�l)�dVd� D�[��V�mC���B���vց�"��O�.�}R�kLv�a0A��[�A�ZPᑕ�x�B:�Ş�q�5��4�Jb�a	eE�Y�[U����g����&��d��Ҧ��onq�Yl`�/��%���I*k�I	���t��D���*5�ԏ�6�͋���v�M����5Ay����� E^�.���X�|�"Z��W' �*F�P�������o���Y`z�Q��D�^MՀ۔����^q���K��i"?�fθ��\��ܗ�[�,R��k�{���n�� ��K܌6���.V���ݯ�%eM^-�B�&|�RD��r���5"sUВF��|�BZh�i҈Zc�q�Kǎ��[���� ;��c���l1�]_x�<��Gz��<��� �QDhI�ޘ��JY"��^���F �*�^L����sl.�
�fHC��40��� ��/0O�˅"VK'��]�L����d	�*��O@4��C�yx��h�d9���c��m2��" �.�. �Q��0s$Q�0Y&q��c~6�⫦Hs�9���ݣ�]N��cz)��Q1��w����&!?ʡ��;w"�d`h��*�:0���b�Г���m�A���aumeA�/�)P_�[Wh�1�@x-��c�ː���(����_�3�?�՝*D�5m
����i5���� "�r����_���(�J�粨CES	��1M�ܫ6�>TФEO� �T5'����+������;k6�d�W6m됏:��S&�5_�,����hg���IŨ�5�	�;�@
�CAH8O78OV6#��\��Oц���� Qn*9s^b�[��p��J�kл:F赖��q����zܔ��ߖ�Fmڥ �55LO WmJ�@mJ	���j�	�]m�-��N�����(�M��Tn�W�u��6�i V0��Q��Ee���J5#u�k.�Ht"��*��V�����e8����~���'�eA��xw
����}juf,��ձ@?p�>�US�>1�;g�B�ŗ���m����eB+�%�6��
6�'�=��^��*--Um��]��S�O����/�W�\|�\<�(ȺQ�%B�h6I��E/�3�,��@��uQ�!��6�\ަ�k�	��ŋWƿ��X��SzSbL�V����3�7��
^6�j)���-�Q�H
���2s�g&Z�%�c����N��@��Ԩ����i��J��MA2!���X�u�"���������L7�ԣ�DKaI���t��4���B�"�4��h��5�Hn2�є�[@Xc	�����tv��
�b�k$c�i'`ɘA��$�Z{�}tw�06����Z��r&/��L��]�=��q ���v��2��8=ؓH��u~�Ը�4���c&�uL㜑8���~������x�=h�㠣&C��?��٦��=j����ۿa�]���4�aH�m|ۉ����g\�������w�Ɛ�[Wb�.��\�o1ڡv?1/X>�ڨ;��rZ�ِ9sS D���+r=ռ�k�=�7�Z��{�֏�[���]�e�]#�ޚV�V'G��l���#��~c����ؽ1aO��+��6YwO�w�n�2;l��B�u?>>�0n��`ۨ��9T0���c��XT�����o����2)�ZZ��������� ܻ�F@�/�x��xF��t�B\>�6�>������7�78��GC4؍����XE�'e� ��x���v�G�0�N�Og����	�縅v��u]��w
R����(z�=���� 6�!wa��Mz��a�w�c��{��d���kP��w�I��?g���xa��s�܋�%����~�!���e�s�5�-�����r���'aGV�z�~3�w���R�ȥ/e���~K���8�dB(�4�G�=K���F��E"�H�C26�����4����ATtڦ�%2ƚ1zD��_���Bi�$z����!ڳ-��M��pn1�^���>�{��(We.�D�� ��s���$B�ylB�Bi�'�
���y������K��0%��|���ۻ�E
�"�����E-�?oNt\q�|�(Ue2T�sM��V)��V�Bq�M)��#�l�{�?:����`m{��pĀ�ց�����&������c��>:/Y��{����~Kt�v���#ڝg��'CsՆ���h��d��F�]�����:6���+F�@|�9
�N ����}�Kx�yDG�a��2�@S��v�c4����")����z�<�������{�I�l˥D��,h��F�,�n�)���IJ�hL\��zb��K�#�� �ĨՀ�Ԁ$1S$9��?����`���(/h�(�O(Y&¹�JwWnY��	4�Rӌ�V9�״]AeV-��;-\��������7��.�F!X=�#�t��-��t�����^D�tp��G$k��ј�����}_{���)�O���t�h��H�=��7�_������w�����g�qZ�W7sC�E7�뷸?������w?����F�7����W;��urp������&�#ΈD����dŰ�������1gq��՝�Py��!�ܬ�񋿶��R=���mK7��Z�ܲҲ$֊��a����;������JO�ui��8���D�@�sFoF��YV��Y �px-t0�g��y���kY�̇dI�ZzK��r�U�?sxT�
�-2�)��o*��X/s�d/H�Ɇ��8�ᥬ��Y�����:*i/+m�_��o25��9ܨ���������"�Vk_H`���k�r���Fv�P7��F5I�T*�[��w���Ѓn�e%U����L�+~��n͉�����_�3��י3�G���Y�	��Z{4(5�?,4��ee+���hD�'	�k��4ޟ�?MQ�f1!���    �D^U�k_f�m������QDv����i��(�堗�^z9�堗�^����h�^ώ�~��j���f��V�=}|zpA˅2��虮]3-o�g����,�Y �7K]S}f���G�����3�y!�:�6`d�<�87 A���+/�d�Re�2�yܤ��t���4 (�5��u6M�3G؈�Ϳ���L�.8��˱��cqu��7�,�X$צo-?ނ�旨$���Q���w��28=n@>���d�@Ũe1 �J�&/Wk��{��.rC��.�JV
3r��B����=�W���4���7���M��B`]�cc}y�>�K���yާ�XQ�i����6��O_�Y���M�J��gU��ʖ��$�Ͱ��B[K�Jgiޣ���\�ح[�N�Z�y��a���ŀ��s5P��hn�%��%���l���0�2U(������_W�[����_d@=hȠ2p
����3��e����Iޞ/��9QoE�Zo�.]c3X��,�;�$R#u�˕L��,��/�3Hya$3f$-He�z7Ֆ�؎��-C�.��v �R���	ׅ��Yα���-b�@�G$/�!��;i_��1cb���@N��O�O�r��J�}��/2��"�HrQG����|j�⊦��+�@�,�2�IK2=�∘�~w��4��C���k��8X�8��t�W|4�?�&�N?����/u�n��;��v�.��G��=�C���S=QgE~���Y��3��E���C�v9-]�{O��c��1���zQ� q<��<�,�#�r�S��y(_��ֆ�=?	cW��$�����x���T�����v��噸�G��L�;�e}��5ٔ��a��"�?���uI+�f��y���g9��p��������g�Ĵ�<�eG6c.�
��w ���{�F��)�����hj��Q�G��,ǝ9"�}CХ���2��� �ӂ�����5V��� ���|!;�uj^`�_�X)���`�m}���G4Ե�(~�kK�ڷ��+�f���^y�Ӝ�Ќb����y�ã���寧�;�1L"��dR�r�9��𠠹2�f�p]Lg�c6��k�[�?��}��W
��`��ه�xz���65���
�,z��]��M���A<�6���UL�5|�Q�_�ĸ)G]ܔ�h8<NưE����dxv|�_~4P�p!�����yrztp��mST�}��V��=J�%R���|߳Rs_�EN^o�_y1�_�`c��!����#���>�Kڍ@��=�����3�~XB���򚝫iI��D��
i�#�{4F[���,6`���o����`9�L�'a0�����i�T��<_VBv�CY�	�VE��`�b|�2�f�<e���^C[���ͼ��p�u�L�%1���{d)]�R��I�嗌Y%��+`\��b��L�����*���쐣�;|�C)��l�J���B�bl�7���s��@�Fg��%p��BN���.Uig����aNs#j#>'�hA�Wx�ŋїۂ�q/:9�E����F�*W�:h�M���n�q�z��z����/�1��ձ���N�����b�d�;٩�Kӕ����f1���񔬤�Z�ecX(�a^SԖ4`�O@�p���!�+ÃN^�f�H��0��;�����^4���e� ɀ�����`�aL��g��8�q8Fu��)|<z8JSz�$#V�x��zt�2ɛ�Q�M \BR��Y7:�;YC�Zr�C�2+k��.9G�h'UJ��!�_y1��`���?<��Gݽ�Ac��$O��_u�?0�;߽!�pe( &�"����Ai�VG�M��O��m�*	��9/�y[�xy�ӆ��}�=�+1E؈*�8�8)��'2ʄ^ qފ��	0) @�_�i8�c5I?+%_�A�W�n����G�W� �ORR�e2�.���7O�z���f�
�%B,ސI�2#�`�l�I�ʙ��eCR�MQ��T s �^UCO\qJ'�:|�`���OJ�
�AD��x����%n("�)'
��>{�A:�@:�o�tx��B��$
�̓kVۢ�#|QJ���+m���A�?Q�dZ�o�cl偩E�ۿN5(|qӇ�̟�rYm��z���R�LH�|S���_��2/�;��J�$D��ǷZB<R�}�����efb�{r⼣��W�d���hs|�<�]c��Dǅ�󍇁�r�Wzx��[�}���T:���%$o��A3��r�-ڹ��G9�;9pr��9H��O�5i�X�吩tEڷ��nx��b'�6��s�%��N��T6�r��I�yUI�r/n`X��'�W� �i蓮�;cb� ��a��D-�tzSo_��/�m�����mQB�Q�!�a.I�(h)��!�*aTfu��`]_��
Tj�em���w��������N�xcI�(/LYe��*��K�ӍƆ3�ƫ�1�0����
����+0)!��;Id�I*N}��bzK�vH]ų�����H����Q��'�$�M��г|��I�R��s�ߊl,��M���h s �(.o�mO��$ͭI�%ǉ���/�;��_-'�SYfrV�ZR�G��&�.$%m	/��;���H~�T�����O�Ȗ�s�ux๧]�+���f3�P�>g9�YMYr~=��sZM�^B�;���۝�>G�y3�����r�^''�#�"{�� �$�r���>�_W�۶��K�l�����>�bm��I$��/�#�����k�u��p�C��������	a��w#���	�^��T�,�T��R���l?�^�[����q.W�F�Z>�r�.@Z3.��>�����7�e	$@�c���������s�`��]�y$��Q���J�d,Qv����zGW|-ir:�K��tb�7�]�
N�|�VR�-�ROWӔ�n����kA1���L��_ю���i�ZO���+fy�٭<z�&"lĝ�&��r�9�6ҧ�Lv�ya�~	��JIv B�@8�ᨇ|�����2��	V^����"U������s�� ��ލAN�n�>K�T���ҾB��D���ͭ��/�}�Q��ԥu�C~*䧾l �Zb���T�C{�+;�6OREY^K��%�3�YɕE�(���?���pZ������*"��#&3��It�L��pe�����$=0:��
i3-���9�`	�v��ȼ�g?�:#�Z�h;8�?瓪�΢��){��=�^�x`�A�����#v»�/���%h��m�Ǻ*�*�h"Mm�]W�
�K]v |H' �l�%����Ip\ߔ�'�J�������M*K%0 ���Y�'��ί�D3�V��IQ0Ks�j�<M����d�7S���gT���"�fm}�_��@L:��M�h�^]kz� ]mbA
����d���5�85i@'jR��q��T�"8X���$֠u�x�2�WAI�g�ʁl�2"9q�FHkT
^�v����f��*$�N]m��d��u+Z�p>�����<��"�
��%tiT�L%�^�?���q�2r7@��-`{p
�r{Ǝ}�h���
�y��+�lE��`���E��8|(7NS'[�_�(�$k�?L�$���8�G�wӤ����K�[ò�@�W̝��/E��c�#��:�1�������1PʟuHի�+����:L�}w�����4�ϒ>��)�U�����0FUD_ŗ���3�<}�}!V�ulV����wv<���pPd�:<���:yp�1�<.l��U�W�s��vg�,�W$D��E͡��N<O���)@����H��t�kTr�j�H��XR[�3�TKڂ���)[��^�����`��I(��䔤4�l?(�7/�:?4<��?Y�d)~�T�"K%����h-Hh���L����KP$M�Hk+��:s}GZ�,aA�Y�X�?k��qeP\���"�	A��R��m�t����5*����A�}.�Y.r��fY�FR�@1��]SX(��?�)�� �������aG^SUGY�)�~�t�abq�#Mmd����d�(��� �r�S���u(�Ĵ�%��0p   ��qE�C�qc�E��յZ�}@�7�TUp��[;W:��Ƨ���50�SL1��`ܕ�t�GƵ.�&^���Q.u���'6yY����hxq2gך�{�� 9H��Aܔu������	��.����e:@�����뼈N��uF�VN�{=���}�^��I� ����7#~��c9VE��@���+�魔�;����*z�Wu�$��6�=�c���e���cj�5���%���E�����i1�s��N'��7��6p���*��`(�
���z��"%jM�z�101� 3m�`�<#����i�W#&1�qZ`�{y�}�q3�^6���r�g��E.�`6Ak�s���u�a�ZUoa�[Fac����Y>m��Ɍ�O�F[F
�9q���gS<OG�k��MZ-|��a=�/�4cp��~cp9N%2��r�]�<�d�j,�/d	�W���9�=�H�u)���ъ*m���6��n�J��8Q�
�E�6�a�k�E�ߛ�l�'�� 6q�{_�$��WA�}�ַ��bz�|�r���mP�;V�F��;6�N�{������6�sC;�?�u1�v���k�2�c�X~���)���=eibiR��FC���i�j96aĹ��x�PV/5�)�����H����Yŭ�����U�)-:Vw���e� �#�8i,��2=VS�k$�oUm ���������d���0ռ��̨ ����%�� ze�9�0 ����i���%~�ߜQ[�+h���8wr��l�K�~��L;�O� �ĖDԦ�6��_Y��VY�:M8��,Q{Jzw�}G�&���Q���K<\\�q��Ūbr{O�1�**T�E����O��F��)D�����m˟��l#A�ں�5i�9��ꝿ
�*�a�i�-s���-���]�=[�]H��f涔C�nA���7��X��[�����l�u�z�ʆ�w3�[��KX|s���X��
��O[��&�*����D-��趄��� -s�-�LEe�F�'+ۮ�x�7��ϓ���uޡ��P�ܼt��_�d֫�/N~�6�hJk�iܭ��@����Ƀ�
Zk'E��9�,��#���s�Ӧ/l2�E����\���R0�
l������{Yw#���.}b����&���V)qcz^�te��,���Y�n8�ѸR ���6�Ť$�ʪ�i�T^_�+��4���G���f
��l�Z��)�M*�f
�P�`d�z���z�Hn�ñE4,!¯+9нN�џC���R8�����z�N�����OF��;;:qn��c7�v�u��u�����r�7��Ӟ I#�{��������׾�	nc8u����G�lܖ��:ؽmLãѐ����sF���A;�����?����9z�<�U/�g��{�v�W����E�E��Ԋ{u��3`�&5�M�B��f�AUdE/J�� �od�Uϊm���ݙ���aD@�R��ӥ� St}.��ch���;A��Q�����͏ns����7tL����T*1B)x8��1.4��ζ�)���G"�%�Lb2�����`ʳ�](0���l�N����H��'S|��m�g��W.k��V��pzMd����&+��suBɡX�0X� �<�fs)��(RS�RI�ޕf(gz�/���E.\+<�JCF���fi�cM��E��wc-��zagz�C��.�te�<�`޺=���K=+��?6^n
�=���薬mY�,=�ɵ��s.�d0�Kj��[�ʐ�
"~�lz�^$$�� �w�%M\A�B"�:�p�lW��H(ϓ�N�[��Yc�;b��+�@u��rB
��\���J��T����H�'e�q{��#O�o`���@���y����i	�!X9bN{�<� �������Yo��*:Y鞴�-�r���Ni��{~�=w@�wY�sҗ�����E�a����W���ؑ3]��V���G���Q��޶�+�����7
�p׾�C�/�����_�,�6�b�8�S���ͤS�V�
4�ޱ
���{6��e�����:��Q:l�����I"I1M�f��r�����R's�&5A��>x�AI셒x���t�pV��HD��������P�p2[��N��u������)sи�;"�Af�C
h^&quDs�{,��v�n���R1FӀ����� �@V=:I�Bx�i�'�D|	R�`2���r9t+�ѳS��e�I�{��N��J�]��9˓J3)HZ..���N�`��0
A|�KȚ��uCgcj\� ����������8���R'i�@2&���D�^�U�m�ڻJzDmz��Du�h�7Sl��%�!d�C��������:g���p����a�\����ڀ��Bw�̑_�0�EovJn��4)}��:��NYĞ�)a����S�w!0:4�����u��Q[���W�ס��X��^4kJ�����cn	��.���9e����� �st��d�~�~�@@���~!@|
�)�z�=��a���ɬn�y^�*�e��ux=�ó�{���I��~8<:=��t�p���o��pN8���/-xi'Ű3N��	�=:�'��ڑ'�� �N���-�p���3],� ��kS,�pv��	���?�U[/`�a�_;2`��2x�'(��IN���8|D
(`�Ѽ��9`�!���'��=ޞ'��p>N�ٷgO,�p�aY�%X8A��a�¹%X8G-�n�Gg'�F-
�8::=;~p6:u9;���q��W_�j��      q   �  x���]o�H���_1W{��� ڛ�m�+��Q�M��J�����!q�_�� 6`�BD�/�>�;��9��[D�Z$Of��TH���D0!'�L���J�#�|���r��'�=0���䔹�R��-�Ʒk��h�4��"Ym�M��\��V����e)r���/�u� 6c|#����y�{��)iNX\�uXnko��9��V��q�}%��ԍ�D��OC�h�$���R"�3ƭU�gw�I���3��>& ��=�G��Ԕ�/D���25e>d��sF��(��`����+�JO*K�h�`�$,��*�����S�1�:���x>ڪ	�t���� @}��O���j/�9�|9��V>!�O���	d7��`�Y"�@�xX���e���;SH�c���l�tI?��.��>�^����KNVM��	�x���Md�U�=I�b��n���M��XE�S�Y����ě껸�Pj
27yA 9k����`�����˒��Y��=x9�u����`R������b������|�������ȅ��Ey%,�Vuü���{�K:#P����>�����VIք�횓,u�	8C�,+��y�^S��o��5\�b4��*���-	w�pK������)��x̜g+��|���U]��j4Ey(̫77w�g��M@5!�=��y�p����C�⎦���{��vW��h��� �r-cQ�n�#�0�j�z�9S&��.���q�e�����ɪ(��`:-�IQD��E�4�/K�c�~�P��2�)w�Ȫ��]5ׁ4���Q����v{��K9x?�t7��v���JX���la��褩M*�
��m�4�	D�}qTPw(Tק�*�)��lC�ąу(�e�C����R:��|�j�0A?�5n�eN�'k!~vyr!��:�	Y�����e#��������?	r���Vk�&�!��`6-�'�u�(��$Ɂ$���h��*�HM���Hz Iփ��҈s�F���f M��q�,�(-�M��8���W,�?_���g+�^G�2�i9�����I�toZpg;L
p�V�>�| ���iVM�lʶ���M��I"Ȫ�}��K2�q��.o���	k����as�v��Ի���r4��r��yl�<���i�X��u�:R����hʼ]�%ی��z���h|yR�I������?�����7	K�+�/�����\R�      s      x������ � �      t     x��Yˎ�6]K_��L�
֫���5y�t��4�K�-�$Q#Jv�W�����^�dν�dY�lm�,�����s�eGk�6Mk�}.�J��Go��.��f�,C�L�q��/���p#��m�lÈ�{I~yL�bsS{����X,��6Xo���@�i8Yo�+���i�*���>ּ-��z��ZU�g��M�)!	�f��E�;�K�`�U���0<Z��ԫm�4�>�����Ώ�;�vV�J��lt{�\U�d:qģ�v�~j��&X���6�-7����O��ÕW�45�w.��7�Rw�p����F�K�l��ٵ�n�A�J����6��O��}��3���`�h4���{x]�A������;!�!N��z\=��å�6:}�>>����#29s5JpQ�����cb�U���O��8@���x��7�kΣ�m@������J?9�g�
�&��8�a$��D\�1����p:�;?ZyO���=�@g�ِsc�H2��d4 ����n���?V�r�>�JV����D���W�3Vv�)ͳ.�Е�Y��c�]!xI�G_��$��*��4��D���O]���D�m���զ�J~�^{�*�h�.hG\�i���A�}q*k-�����H Į^h�X�D�y��JɲЕݴ�,0$w;,�O�u![��ęR@Mq��4WNJBvJ�]�D��V�Y�,`N�B��,�J���bq0�K&�rs�ݰmmE)+�W"�0�jܪ[�PA�&�K�su��'��o������|��{�w����Ïƾ�y����|�l�v�V�m�#Uz!���ցa��i:��xV-�����P0ީ��3��m�9�&��'I.��K͈�\|H��=r���E@�T<���Z��a����m �2�bN@y��D����¾�X���4`+�����֟����4��A��`��R��-��E�V��1!"�]?��{]�Xs�'��l~��VYh(��>���Ӫ�*h��2�98��аiNn���8�:ͅ,
s��@I���&�L�9B@5�,��C�
�:C}�a���y�@��'�����	/|�l�}����� �3&��K�e��"T�	�-�A�=�%Or���D�Y5/�J\q�% �Qe���cB^�+����IQ��( P�Z���	��0�ߏ6RbfB��Kgt.F����Ce��������@pT}D���LIBB�B�S?�\NM��e'85i�3� 뫆!�tĲͱ��KO�ߵS�TF��)?���{����3��Y�$|������8�z���QH�.���B�5���Q���~]� 86G��b"�]SPR������-1ʬ3t��;$&�s��ZL�����~����3G��\�;�f<2 jE�ý��{���T�[A�݅��A/��3��_l}��������Y���l��,���=��kQR]���ã�W�Ί��	�(a�e��W}i��v�����<=��޼{��CqL<�6�0Aa:J�,Lu��/�����2-��oQV�Z�� �[�L������ -bR���C�P���:,�H�ڐR��y�DĀ�������8&���[PX�3�eZ�����p$��G��D��m<Ǣ4#�CC�D,L�����
��!��{�+Y��aH��|wu�R�%�]�3��~��{�k�fxǍ)m��H���p{y'?�$�R��ƿ�*�vJ�����D
��_őK�Q�(��7�1/b���a;$/�+ټ�:���tƍ�K�ȼ�D-L���]+������ԍ��ё�z���M��)��>V����3;��lQ��e�o`y�k�Qb5&:���1A0����P�A̩<�P�e��b�l8��&I���2Z)E�7���<�ߺmdK�d���<�%V}K���M�z��%��s��襐���`8kJ^�_.}�$�!���o�f��銹:(>[�6{6�\'�uK���?��=�&�75)
��
Iֱ���}[Ck��Ag���Ʋ��.5ǩ����;O$�S��`��c:{��H��^�-�=E�ѱ�l[Na�P`��[%F4.g6&�δ���jҼ28މ1�Ș��(G5���ⱑS��J�P��w�qL����i�z �xB����;����J*qd4҈�Ty���<FP�.���5k��I�Jd�MGq�u�5+�m�.�=�/*��}"wY�<��+�`�?h��"P��N��P��P�Y�؈�H{#o,=�j��C��P��g�qk��s���u?���~d��|�b�G����ҀS�&5�E���wּ��L�eU���A���ӹ��rT4\ ��t���]OU\�GH�>m�����{�5z�T�fT�Ҕ7t����V�Z15@��@K�2C� �#9�4���="�{�ƞ��Ȓ�,��5�b�oo䐳��D�ʦ����`�R*u��#��}~� .�^Ж�>S�������껫�5��~:9��G__]܊�p�[ ��NR	��l�&�&ԕ+ �T�R�"^A->y�=:�_T���� ����Vw�:�F�goF�gR�n���N���Hh���=d�1�˔hd��T�/�(.�t`NHaCT�^�VLh:_��d�`��q�qHҁ(���#�jj�Ӯ����P��Ng�~��� ���*�LmW���wU5����DݨJu�-�BQ�� ��n���f���&�q8�$^IN��K�}�F6��:��������RI$����iaL�o�������f6�����c*RH`�_m�h���;^�3�άC;��P�2�����	����%��K�PS�pa3�;&�awH���4vn�����}ӯ��u�Bx�"쓧k�닦�����~g\�E�"v�3W2��窪�^��=���q����U$�@ �|e��H[�-�����v��!�D�� 9C: f뮲rS JO�%���t�K�4͍aGs�;�4|�&[���ZU�Zs��.]{5�O����x���Qf[,      �     x��RMo�@=��b�*�DB�x�����q���Kv���{��"Z��mB7o���qH��D
E��N��e����2y['\�RD9B�����*�Q	k�R�1h�TY��"ѻɫ?с0b[�3b��9��y����O�K��s,Ϛ�p�<aF�RYv�.�g�P��e\l�_q��--7@W�ɝ�i)�2�07��B�Gt� �k#����#˖�I��4n/�K�^�)P8>�1Gϥ�q����7�}"�O�H��7Ʀ�5}�2��#��4�*A�U��p'�Qu�'�~4o���t�3o�Xz�!_�"�~q|����q)�_�7�.�G�� y��֕�A�����+�9>�v�Mq����7�z�'B�+n�<���`���$=      v   �  x�}TAn1<K��� )i��cz�%���K�0��nR��ʎW�:>��p8Z�mV��$v4t$��f|ɉ{|�o�娂���Ktǿ��"K�Ys��6kBv����z���x�_�@�ҨTn����qD��a�?H��%[u*���::(�AC�E%)cNϽ�{�>��}�`IS�`��I�A�5��f�
�~�_?=����1(�'n�ɘ�H6Y檛r?1�j��_������G�,��JU��V�4ӯR`(��Z���$���8�㯊�>R�M����+*�A�����:x����i{IY1�'�c%sQ�z�J�q�Ε�lQ��.��)�X|���01��{�ӡ?�����Ҋ�:b�>@m�J�������{2���pS�H��V�9�,��zB�	[ج�tRes���"�Wq�֩��[�v_�	�7Q/
\na�l�&���(�\�PǺ�b�;曓�����{����      x   �  x����n1���S��<��� �J�Jo%R�@}{f��f�Kڭ[y�����:�c#b5�-����֦l9s0h��jv��A"*�\Uĝ��6d�KE4�jk����(��'[g��реc�Ϝ�����2PQlP��'=������Y2$x�<Ë\��^�k�K�X��ww6m��4���(%�1��<u�}4�A�sG���<�� r�<�|���gƅ��0�(wq���Q�H(-�C�
�ɚz5�n���7��@]>�3��Lq@��~ޗv2�f�3�QĲ7�d�G�~�LX� �]Z?��@�P�(���cv<�&��h�d?* fе�oH$�ގ(�؂(�m{�r ~H{Eڼ9ݪ��� ;=��:+��|��)=��ĉ�.%L�V��_Pv�D>������$��< �8J��Β̓��M���Z�������0��uT�&��{�0����bNZd�1sH�pPk�o�zg��P�z��a��Wa�����^�dg�H��d�qO p'D���� �����y��w�B�J��91�7���	b���z� �d�o��YU���I4�R��� ׀��>��Oǿ�_^�s�Ʌ��T/'
ˬzo�>})��>m�^G���d�o�Ym����f��&BV�      z   �   x�����0�g�)2��┿�Q`C�Ȓ���Z�T��㓸b6Rb��;}����:�6~g]>���qc�:����\����h����B�����3����A����r�PG5�kl�)�ޕ�Z�Y��]K�%��K�'�e���Nu�8u���dM�~�RM�x��C��'�)��Л���C�Q���G3e<F�cV2h��,˲/�;��      |   �
  x��[K��8>��N{�N��m3��Y �3=X���Vw�q[�����"))R�Eۛ�� �]�X�Ճt�%����%�1��-��$OiVѲ����z�����z�S�-�$�ݗ���ns�{~�;�N��U��<7��$���7M�>���k7E"�--R�W�T��O�[�S"+������&��L?��`�2%EE��(T��L6���s3�i/=�HY�ܲi��=��ts��[��L~��l>?�$T�P��a����D�w/��.�}�9��Ӯ=X:nz��,����`��������d���3O~���6}x9� �<[�iU�t���6ͱ�
!J[�J���ԟ�/W��QY���?�s,K������xm4	���OM���~��$b���e n���ҝ��]W?�K�-��=�@��r�8I)�DiL;*y%��>&�͇X�\�O�~ߦ_��~��!�,_d\a#D2nV���� �{rhfa!�V��e&#KN���Y�b�3��1��S@��l������5��=��oN�WA�|�t�+bN�%����(޼�{�����e	�	Eԉ��S�A� �Yx�՟M���^Zΰ�\u&���QvK5���lJoL�JQQ�͖�����B�Ĳ��g����42/�,�e����k�g���	&n%�Ċ�;��'�s�0Kr�xI���̍��a�'��p;��s�ȗa
��0EF^��\���ҟH��ŽAN��hY@�͘� � �!m���� v/	 �w�%I�0�5`����!j��0����k���Z0A�wfg���:0A��
Ld���Y�:0A�6�f����Y�*0���O���1U�X�P��Z�)%P���6.A?�Ҕ瀏eӒ?㰁ΆY��KվB��N��nrá}��`��#��K�Y�vw����q����k���R󠶅�[!`u�J	��Kڥ}1�M�G <Z S�W��\��OހVJxòϼ� M �\T�r��-�l�[�g{��J�mR8*7,nP<^�X��Z���ai+u�f��e;�GX������\X��1J��,f��d@�F��ǥzLY%��6��sPRh,CjI6hsR᠕�AMizD���ED�*8xG���A-G)u�f�rb�Y���<�����6�ю�|�'.�0ry�F.#(�X�:�5�8ٚI��L�e?:	5F�)�Xaq�H�^OQ�yoe�I�ӬY:*5��q�A;��x/�P�e?��4M��<t;0�ǽ�"��̦d%�轒M�W(�T�3�9T��4K�������\[Ga�BbHX.0�L���ħu%O�hU1��s�x��o#�k�,y_�K/-9���~�P
w�D"����H	u��6�TG*�H��J���\�et­��90���<),�P�Ǧ��v�R.BWR1�t����AB7�ِ��r\9�k�2o֟xʈ�/��,���
d\٠�� 6G���!���T��s��|��,�7�C�0�+�8�e�4`���Gu�)��E��YA���T���US�-sOm�(a�ρ���"�<0'���G<�*C}t��'&�F]H����ݩ=�Rg|�/�z�i��RY���U�6Z��L���k<U��k���c���n�=�ۮ{춸���U��S����e�U<��h^]GTX�9�9�jw]���m'�C��,���]�P�ӏY	���L�����j�[�p5��ٴH����Ѭ"�����/[�ڥ�,��1&�;3ǩ��UA(�e���i�덞�U��y:�s���,��A|��h�Zf�@����a}�G基�pYKO��Rk����6_=Y��y15���4�+���t��&V#��D�X9K3��6d��7	�B��s���F[��X�x\]�Y��\ڈy}�R j#V���-ֿsO-��r#K�M���X�%�}ڈ���Iq�H����4m�9��編�D��ǜ���C\^��`9�)�h&�"p�	]��~��vH�b!���fhI(
I��B��z|gk6�clF��VoӞѐ&E�ԶO�&����Nu�d)�q"�P��<*0�U%�GK�m7f0��yOy!�P�$��/K>��)�ړ�H<\�z&?Vd�-�ŝ�
|+�%�<fZ��$]_A
5N�Y�-X,��Zn�&&�r�/9�?������Nt����6�����X�4k ?]"smڌ<��8	uR-�l���]j�4$��Zm��F��@}]m�����q���	Q`�ޞ=.س�x��=0س��Yޱ�n�т�L�S�R��kKTܕ����-*���ZN�+	���n�d�~4�)
�P���V� �A]f���^��=�iIF�-8���E�(UOǤ:��:����<���S5�Xu���`4ϼA4H�(h�䒂����9<5�������Gg��H(j~�6�/N��3I���� �d�>@F#u�F�ʪvDtܡ�ż��ֈƽ��'�9�x�O1�xi�� Xz~>���L�,� 3?����B��_!��r�����)��>��������.TޝuP�O����`_��G�� U^
Ӊ
�?�}�E��"���q��5�SZ�z�n�W?�^	��B�ٗ�'�3<��7�J�|Hi�(Ya��,"�������� ӿ�      ~   /  x�%�A�!��FD�/��wl
�ɈiIm�z�һ���W�5��Ӑ���dߥ��*;�ֲ-�L�[�[v�tm]�b��YC�����J�����:*����b��uL��p$ [ڐ㊒`���$�A%.�["L"�/�T�K~W�moeH��Ȓdr��$�A%oÖ��L�dO�#Y��K1�V])m��1W��5���K�OʇT*�L*��T����u0@Fs�_�6X�i��A��c��<`b�o�� 6�bӱ)6�F�66�Al��)id.9id��A��F��F��K�XJ@��FN��CNI K9���%����ۋ�Cl��f���Al��l���Al$��{H<a��A�g#
���GhD��:
���)�@#
T�(x���(|/�杹n����x��>���+8
�A��(�Q�o��ANq����>��il���;��� ����
l��Q�Flԙ-+�f� ��Al��!�f� 6ވ��7b����9�W���Alt�mo�F���xޕRy�b�����}#6���S���7���D�J��0      �   �  x�}�MO�0����qCjg;_m�|�'����m����������!������7o�x� �F��]���~���u5���ДF��R���/E�Ϋ���E��}
$Hf<R,�C�#��vZ:w�!N��8�%F�Wu����c�Tˬ������A:��D�"�	�Sp��JG\�ȋ¾L�.q��!'��A��q�x��$(�ò����a�W��[�ܣYWҎЬӥ*�y9Ϣ��)�K�#x��5��e��S���u8�G�*!q���u]�a?�V]��p�R��rDw�	��u䜣�H�X��f@'�������[��6�6~[ϫ��n`s���NL�w���Ρ=�Ɉ&K'��iq/7�g߆	��-o�����?t܆��m�5Tl v�k�$�u��I      �      x������ � �      �   D  x�}W�n�6������ 6Dٲ�ei�vX�ɶ�$h���J�ARIݫ���pO��P���������;�G�GoK�e�5�6����4Ig�NҔ%�<Ir>�ңt�8D�|>�f��n��#z &�M�ԓd@{l,��v�Y��6�It]����h<�Ρ�*Ǔ�瓄O�+�@u��8i��U��V��88@%W�d�x��Wy���Igб���S���u��~w�Fuv4<B�&<x?CX�#�dŒe�fy��P<z#+�5������_{7�0�����d>�'�l��o�,x�̳%yK���(��x4ۈ]�1��I�6�"�ʪ���y�D�����9��~���3�le��6zR[�ƃ�pʯ���,(��yf;�1-ZI�Zٮ�u�4�I6�m1k�Ւ�v+
όf~#��B:�L��V����8�w�)���DT��q����`���8�ѭj��e��#׏�4>5�c�C���|�*�K��H�$�/B��2>�B�|zVą�b��aC|@fgFq�3&:ɶ����HG����H1>�.'3��,�H��Y�-��XF��V5��D����f��4�y��3l]YӲ߄W:gC��q	'��lɬl��%�
��l�c��N�SZy@Abeaj��c�ZY��`�[���+Za�� &L 
�
P��Ŕ}�T�Z���P�s�P���R��=dw�F�'�HZ=� ;��"�=��̳l��Z���Z��>PL�D/��K)�fw9CRVT�L��[x���c��+|g�e�p��v&�����0	�YM6m���P[đ��m;���>}d�C�WEoBkP57]+�`��*�wT�A�Z�����ދb�J�/��U�Y����!��{��~�x?�����A����k��15�q�h�s���ʍ��P\p\ನlg����%��[lTSZ�/.��J���F���/]=�k@���A��Rx�8�(fXA�]A!,�x�t�5,l!]�����t�~�R�@|��%�^e������9��
O�.%2s�2�w�4�hx�v�}��˕�M�b-5(hj��j�������Z��#A��΀�w/R �A�7��rS�V��w%�����zF��W�4x� k���?*�^l7{��������X��!�-d5��\\2�Ɂ�`f �Ƙ�?��1k���jx8��"�$�*�(����?��Qpq)��r��ɩ�{(tW��1j��2�!��Cw�&iq��(��FbN��� �2��&���W��q��Zy�l�����N�NuS���,z��荠�UU�.*��K�����s*8�)Ԣ�]
�>���'o-N�}ýx�o���u+���uC5-j�)����]�z�$K;qF�d4l+��7
W���ߊ����*6�}�'��]�яm��~r������9����]��䠬�P*��˂�Ȧ��/�_)�:�+ �C��RT�u("j+eO����eN�U�)�
��(������o�D�j(������e!a��.�'�4^}65�a��������̳}k�,	_ ˾�Ekq�vkWX�%Sqy�F���~^,Ў�|��%}^�?���*Kz��Y�7+e?L�8�~$      �      x������ � �      �   �  x��Y�v뺲s�gJ	9x�-++�;IP9g�m*���}�[��)�P���jk�����V.�ҺLK�O�.�R2��Y�t�l���f�l6�j��˝���S��o87�Y�_ΝT0/����J��&��m�3GM3��^&ֶF*�������_�dn��2��ۋ�����8�v0w^+/.��#Fe�����n�1C��۹g7��D������\>c�P����<�:��HG�E�C���0'���.s�G��))\I�������o�v�l��l���l����u8�/�/Պ!JG���N��"�b���3��<���
�3�J�F�A������^ �k��Z�@%��=:�L��V��Gfl����;_��<m>L�T�4M�_�~sX��z1�:��??P��vR*�*9ZK!�f�Aa�"���3���_A�} Ş�~�왪(`HHĤ ��(�*��x<D�q����n�>9�|�ư9&�q!���L=�\��0yF�&���{,H���i7�@3ºƧ��V�F�J�r	C@� �]��}���<k-e�:\ט�r��2�8f�e-�d�E3Shy��:�l����/��JI)�5'�`��	�"�h|_������N��%D7l3%���֧��"�Y�%�c�`��I��Ƴ�{��_O_&�#�4d2��wx�!���-��v"�+��?��[�_~`�Q���#y����g��K�kv8��}��K<�5	 r�"H_n])�����t���8�LQ���O��e �4w|��5�U?�_6�e����t��t�6��]�k&��l{}�X��q7J�z�$���u?a�#�t�>JH��G����䂕�g��%�V�r"4q���0�����!
h��N�,�Z���Y�`�b�󯃜���%;à�l�|bO_
�aY�9��Q�,���|����TJ��c�C�E�)b�k��g|a��0}F��8��[1���é��K�k�Q ]�$�	���6N�l@��m���ٙ_��s�6Ñ��>�F���ٽ�*`��Vc>MyP	��g
Z�bT^GAYD�%�ǲ�9�m:����2��!�SJ�E��-3����=a�Z�a�`&�{!�-��g|���퇏����+E���]C�va�U��W���B�l���8��wtd7�R(m��o���a�ע�i�c�4҅H���ȒQ!��sdŶ<&�D9<}����6�	pW� �PH��PJ�if7;Sgs�J\�0�>�H�C^�s�VM������g�S⤃�J��*q֍�h���1��i�������u�8�*�R����Q�}�#Nh5�7�
�p
ġpC�� |$03���ww(�b����������I���J+QH�O�FwY[jb�i�ڶR�ʇׄ�#8���Wt`�`�L���1C�#s}����.�V]/� ��������#sܷ��+�|��9M���bRW�mG�[��[��H,�Z��Kǎ�D"re��\��5%<��Q7����X����
x�+x��J���Uď�����u�GA���@O_��^99�W��0����N�V08�a���,��D��l5yl�7��.�%%\�٧�{��oB�e���^1������\��i�d�C��lHQ@���9�
�f|6q�+���Q��E�Ng����u��[kVi����&NVεQ��O�E�neH���"^��T(,#�@��� �B�/�>� h<@�=�GT�AgPL 5�,X�v����@	�Jo��#�����LD+cqY��_e�1�AXX	��_�E�Ϭ����{�@��ր,J�7>�hm�\�zc�0�8D���I�H-����Β����q�h#�/���ͱ�9��q,e̾C������~X���R~Ք�	�� �¢����Q�R�Y�*��(�<WS�Ma%� ��.8��֣w��ͷ��L�O����[_��Df�Γm9A+ȟ��D�LW�r6L�^> �l0�b�I$��� ��< 
'%EX3W`�  V�|��Rj,B��������w��9�0��;"��j�\3w����*��]�H�qA����M��눳�t�^�k���z�h'����H*~�kŀqk��@<�#�Q�:�b4#�@.�%/�o�Ov�:~��p]��Q!�z;��ɠ�s���V䭶Y�����Zʼ7�E��X�a��f����6,���R��om��[w`XAo�q�]h�AF<�U�o�$� ����ԭq���O�����*Y|yA�|XM�Ji�_o;v�[_���]�z[u��$�k�;�}9Ʌ�P	�*�43N?xY��:�����!Q�Ǯ䖢!��V�<��Zy���
ߧ&,���Kx�3���l��7�ӹ�9�Թ�i{]C�Q�#��Jϻ�j���t��U$6�]���_[1ru���տv�H�(�<�dPx�	�+dT���0]���t>m;�@E�4�ϖ&Qi'_ާ���z�v*�OOk�%�fKt:��v���I�?
��r\ =g�+ߊ�c�G�(����>��v<�Sp������2R
��R�6 �����qg�<_.�Vy��N��z�����n�����!�Z9��q�YQ內�S�ˮL�:6EPZ�>�`z��{��.����OS�(�+2V�؅���S@52P�n
�k�v�O�@ʷ>
� zCp١wOpur���u2(��0)���
�.b�3�K�����7�v�#���]6�e�Ӯf>q9�]zRs���x���C��w�p���l��Ҏޘj��x��m&�i�>�qvtB	�oR���B��+YZC6Y���eo1�d.LA��t��B�Q�X-�e(v�~8�.�Ix����Q�
�X��R��r�A�J��j�k/`���}˵ޢO�T�k�5�������x��Lz��;{?�śe�)�^f���By�/��a+�/�}4�%GH�!j9��KWN/����og�ǥ�|xT`��O��	i$�>��yQ�C�;���f�].�b��K:Y.$������»�z��㧃�q}.��7�2n�s����V����h���w��!�.�I��^"9���.d}jbu�a�����	xdn��s�~�M;� R���D*�� �.���A�����h螜�|�9��[X�ď���nw��j��+�^6��ΰ�.��e�5Q�O�)Xl�[3ܧ����K�ևi��FM�=w�,:7ſ�ϧ)_��G�a��(�ބ|�/��Oa?pA�@}����"XU�G��� ���l��|<�G;�X|Sns�Q����͆��$����+����&��-�Q�m����n6�A]�Hq�kp��o��5��(��@��G,}h� 5,%@�$`ҩ�]b �#��a�o?1��z��9�W��0��Ʃ�뽖F����;�f	�lkyC���>a7f�;Y�z'H�3�k C�A�;�o.���O�C��?�.��ۢm�U'%ެy�dWSCo^jݯw�1۴����Z�Շ�(6g0��M���O��&z9
�����Lo��s%)�%����|�(O�/a�;J��Q�=���W�B�T��j~i��m��ץa�;��*Mv�^��p�w�N5�8�t������R*�˅�חK����/f3��@������5頁�R�<>�o�Wl�,z���*:�f��Cub�R~�	z�����v�����Qn�'���	,C��?���Ӈl��͠e6!a��.$m�A�_L��>%V�uU{���p5��f/s������GS�7+�q;_:�-��g�_�WD,{�ym��rb��r?{�ymw����Ը2-��+R���wɚJ����%����
Y�sԀ�Q��԰�RG�>�\/�:� ������a���������&�Y5�^�:�5+��~Q���Å�;�oq��B+r�x��<n�f}�������J��6��G�%�"_��'��ϟ��,-�      �   y  x��W�n�8=�_�Ӝڑ(y�|k��� �F�eN}�%�&ZD9��맊���$)����*AH-�Je'�$";]�Iv�D���<&����x���*֚�3<�Ǝyɪ�d{�d�Y��(��%�x�p�ʌE���GV���E0�o��U%������/��q�u�-���_�ˉ��E�X����r�=WTJQI��7����%Ax�!<�����y���-�z���'Nj"i`���|�[7�5�o��[�B%�!�xg�2-�.8Ld1��U�ǆ&@�YTL�9>H��[^4��]��Hf�T�~ �?�M3��х� ���܍�j���֜�#+����I85�u��yi�n�޷�<h��I.b�"�of�5�<�A�e"+y̓�J$�af_�
�ĉ�"�d� M�+�Y�	[��:�;eoE�da��[�!���]n�pv�R������Ǯ~HX/�R[��D�Q�@.lnE"3�U�HU��ՙ
�|W��D�����z��֫���j�*Ej��&8
��Z�2���SV��(�I�_e���E!�T�Og�E��2�� [�V�9v����k{x�2�etC^*QV�B�g��'��ݪO?��z��>�ۖ�����q4�y�_X��@g�Fy��sJ�PX�k�ߡ�7��)��8�0'��S�q�;\�I@�5/c����S3�}�s��_H��WJ�zL~�k����.A���a0�&yRџ[~)��~,'����r���;���C.����M+e�F��)�	
�<�w0�b�˭>��"��d�3N�_쩭Er�F"�&��-hv���L�X7]�����Y������ X!�L(K�j��j�jz +��ų���9C�j�֫��4"�Ve��Jm>h��Ĕof�~Wo��n��'G�Wc�����a�>]�Hw�<����覅�_�ڵ�C:۵%�-�>����z5���S�Z��B�8D��p�G�����>���ma{��	P��m�&C�?�
©|p�Ù�Ŋ�w $�Á"֗C���c��d�����5K��B���1���s�M;�kѠ��(�=�R���l�;N��[���P���iћH���B9A;Φ�թ9�: �t\�|.$��:`��Y�p5�Ӎ;���^�d�l@��~���öE      �     x��V�n�6=�_�Ss�8��l��i�����^(i,�H���z��3�$;��]�F[�p��{Ì�*����U,�O��W���u�Y�i��)��2~nڮЪ�QM}S1���׿X�WlM��ئIq�ǪQF4���H+�uv�4�B�Rw�2��U�g�п�4��ޫ��J�A#���RmU)jg��/؊߲_��2{���!���7�@�^� 
����u����EiMpV��S^�w�s�_��߱'��N�%\�W9%d���K�l������ &����Q� 1[�H�>��8�}��� *�D��]W�U*�e�gK~Ϟ��`C���_@6X^����\�Vt�/�G��Z�;i���
��RZ���N�;<(v��}���=7Ri�
M�q�K�o��)�bJ�����}�S��P��:�!�+1����n��S_��b!���g�A@�w�� W�������8�r¨n�6�_���ճV�ø�>W��=F�=eYγ��:d��K����َʕ�rDϑ���ȝB~��A��t'�w��l}���!4�������a�<���~�6�hM2�ϗ�^I=s\����{����{E�ΐQ��ߩH���I2rJ�{���3�����5
=ޚ9ڍ[]�1C��7��(�)c2q,i!=�ɒ��r8|�˪P�A#5���Us��t9�2)$B|���ʝ8���H��	����6�r��-�=X���;-i�^�(��;��yk���=EE`_��'9/�8�&����-����(�1��O������K@4h�����R����R�b�O�$�~�&9�Il֎�&.�h4$o�B?��A��N�����`��k�'b��^3�su3<�0x�ƣ����ɢ�
T���R�� r ��R
pт��X����cLou��	���
�)��GZ+���4�ñE��'�/m�xڼ�x)���3��������ަ�3�zrr�<z����f��&ڡ|�0��w����MZ$k�O>65[����"�      �   �   x����q1D�Qn�X	IG����.�=�?n�owX������;�wc1=��z�m{O�1H
.h�m[��W�j��JmՊ�L����+.=a�xdGζXiTO`�� ���q
�9��y��������==������'�vA��c��;0�v�[��a�#��!�z�~zp7F4>�a��0H��N!����e��;kt�Y>?��㫔�y���      �      x��}�r�F��o�S�v��I�(Z���|I�'��<�3U�J��dG A��S�j���u^o?�Y�Z� H)���#*��Q	�Fc�/�:�;�����M������6����KW��u��R>���/L���i�r���k�&&s��6���RiU��xo��ce�ϼ*݊���֍��L�|��F��X���\骪������zp�g妊�Z����bR��[^Y�I��M�+�7�j���tG[����{c���х~�x�
{i���s�i��Y�Z�p텛���RO
�+�2�5%=�H���d��mN���+����Exs[�<zl���i���o,���zK��m)S�N�#�kWK��ں4���ӽ��n��W���f{��η���lS�;�w����g����r�f�ru�����#��)Qvg��h��:�zpxz�3ǰ ��>{��N��g���?�o�����z��˩�3�^�K���߻��G���E?"�zG�@�N�Eoޖ���ޕa�1
��.�*\9�ת1��պ^+�4�Vt��.M٨��MK/�.��^���%_�*tF$�oϕf��חo�އ��7�V�(�Ŕ��(�N5å�zլp]�1�W���d��n��Ǚ惥G%�5=ǂ�Hfˬhs����?�D[�n��f�jA��i8�ҬUn�SCd�X�8�9�)̈́8�`1L8���^N|���@EGDE�{���Y۸?7mdn��4�������'u4�����^���ѫ#��.��B6un+ED��%� �hkH2�<��%K����lC�iqѥ5+�q����C�� �`v�unqu:�������:��2�׮t�'�ύ����DZ[O�֖�6Q=q�u%��-�m�ʔ�zP:�LՐl18F��.���Ҩ������.��1�ý�{��wf���Kzq��t6��x��J����`����C����_7-{\|�/傼��f��!NN�ON�?�+}�������"�5I$��w�����7� ����h�I[<}RX"�ua�rg�>�{�������t�1=�+����3�V}Z�&������u��C''�W���o�l��OId����K�DJ�O��Ipjo�]ۨ����'�#$�yE�:��G���H=8���t����ټ��:�f�~��^���&{��NZ��'w塞>+\v������'�X�E�R/v�f�u5�QkA��咀 ��0�o� FJ_��/3Q$����c"���t�-tMK����bfYR�O������:�󕪹&՘җ�. 
{��%��[�D+�9,VM�6�_�-ސ�PL����lf�D�<22��&=��d���Qr2}�Z������D/����ǹ�3�-�L#���!-���t2�f:�M��6R��H���埯=���zGRp_� �7A2�1�!�H����]����\�˵Gb�D����|�i��<��O��o���y�{�}�6{K\�)�xד���{�9#jē��lƼ�2)3�54!��@Z�&�@��}�jmI�U�]�����%c�_n�>R�0JO�=����ѣ��y�sl������u���˗{+:va��dp�I	�bri���|h��.Mx�Շ�2"f�k�|H ���k$xR:�GDux�$P�<�b}���u���'����S�c��9=�O�?��Ӓ�]ȑ��-9J�����v�n�槁��<.LC��>	�xyQf.g�>8!�1i.��N�wE�����ҟ}R�;д��N�ȁ���uS�yz�uW>�m��O��%��g����ofc8��%��U�^�mcx�D�V�����������ѯ�j��5�kڄ�`�F����5+��py���6?�t2Ʌ�&��@��'�NO�w��w�z]5������z?��2�
l6��M_)gFO�5���4�{��-Yֹ��I�6�]/~���p�߆v�X���B�I+#��yr�W�;��9�t��hJ�!iwb��|x�����j�L��'S�|�
	�[��}�F7!��fu�zpgD\9�X���KW[1$ya����Z��Ik򳔮!S�zN{Z����F!r�$������L��"_ a��\�!��ui��h�3ڱ��ME�-%	�$��K�߱�u�qЙ]��K튥6X�BDZ�.������~�V0�7T��
�P.���]��V�M�*��kY7M�F�e�����b�6Hǩ��3α�
jl_����Y�>u�S��qx�b�>�-1�Ntm�-�dا������KE�.�G*?dJ�e�i:���O��37Q[)������L���p��Vr �a
�.��"�k �It�fo�jN�7+$��e����s�*Ss�r�[�$_�m�����nFo$�$�ə#�8��|����U��.\d�m��}�+�2�ʵ�8%k�P���2�MC�Y��ʻ��0��K%��kV���&z�:�C�k#50�� TQ4�=@�3�����IzW��6Mtg��|�!��=�5��(̇`��j]�QST�\m��"��2(Ϋ�AD���ߎ:"�0C�:��']��A`@6/I欇�&Xr�f���z�B���Fr��";'ʜ���ԑ�q��M�O�G8,S���e�X�;Jg8��0��H�&����ǐ"��V��j����@$o��{'����p��nƔ���o��/�[����I�����@�V���^ �@[m�--D�h!�R�
����A�"���؅�q�5�$;|xz||��_I��r�����޹
�	�$����+�ι�.W�!�����ӽ�U����^48��}�g_��B�N.�'\�s2�~���j_�Cl�)����5d�-MAD�&k��2%��&�@'�-$+Ao�D�|L�(]e�X�����dȬ�3��-H�ki��M9$9(]�$B3�$�W��<��9}qR�����+Y�.U[�ځ��UR��t��t����
����V�"��y�M�;����9�9d��&����٫��R�+��eD�͕�@g��,�:�+9�IΦD7�I�&r��K?[蟈��$�D4H�+j��a .�͆�ߛ�:GA62����?�"���W��^&�i���Tat*�]1�y��wR�v�^"�JR&��ѕ�P|/sFn�N�I��K�������x�#����*B�"ЄzBP���l��n�0E�
)�&<�%(��c�%	�7͝�r�0��}X�^�k����'n���R�@��*y��v�oȄx��례��t���np�დg�@6�5��{�>��+M�� @�i|�EN�w�D�R�B�{����5nE�� ��pբ-e�5'�0������J(��U��a��
_��
Y��J���v�j$)�mg������f�Th^N�����s��^�!�d�i��gȊI�nz��]�5�Ջ�S9:�a��BK�:��被���/��-a	��S�!}[V-��1����]p��ns�F�_;
Y�\ʂfrQ#�z�H's�/�v��܁�=����+bQ��t�&���K�i\H�F\B�д�+��SL���K�ӥ�%n��}�5#��Z8�B?�m�6�pX�w�6��\)��	��:;N���;Vsd6Ҫ��k-�1g�)i-X<Hݣ�Kw�Pa��hr�ж�7� ��N vF�>�[/) Y��D�Ihp�p?܋�.�e���_����~*�*�r#`@�"$&�/7 Z��u���y�%�]���\Q���=����MTYWsrS��G���N����Xw��H<�C�������g�9�9����Z��� ]N~/��k:~���I_$}��^�I&���pY�q%��9g=3S4���R�FIx��BQ%�l��-�[F�@2,P4��뇱�/�e�~���-HI环�
uwA׊jE}<a�*N��P��(Y�����T�D$�p�T��9]x��B��ǹ�G�ںr���To=`r�&���u��X�Z,�46�ۀB�j�סL#)��^;g�W��o�2�����h�c�C�
:T	�$č��C1�����(�]W~�Зi�\+��K�ej��c.լ�9�v��cmDM��X    �K��5��ټ_��*W7\��KӪq=��e�V�e�+�?�M�k��^��z�|�� �\��vS�-�����&.�����;ix
��k.R�K��j�	�h����Ph�fŢ*�K(�!���LӖ�q��աtaj�����vcuF���[ r�Qt���P����5�z@���],�+����ur}o�F 	,=seiv>F�Bf���MR^�`�wzS�o�����xI�?��YCG�mw֜��g�D{Y<�b�/6�`
�&	����2N�@���%[���W�&��Z��Z���5���$]��k���Wc*n"@5(�a]�3� "���H�#ส�j�.����[��%�y�0*�8q�θ�0Bi���.G	]��Eˍg<g��r�tII��(nu�|5]9XC�c�P7�()��tI�}�R;w�� ˄��﯌��)I�%�9�I����J��Z��)Z���S�4P�x������/BC9]��4�sb��5���[��9`�G1N�a�4!c�*�Y3��ɸ�N�i�|���7��y�AړӃ���J�#���g�mm�`ǥ�ذ���ܫ���1oΩ@l;��2#�ܵE��<'�X����ɬ3;���0p�[S�Y�Z`��!��B��ס�� �gˈ�pł�G����
.�����c+|�H���W�9m�0��r�y �m�A���[@��h$���F2�e�G���f��6�։{�m��s�7%�r����F���_��Հ{r�\X4�ى�v�mg��k��X�9S=y�y�X�{Xo�Hz4�Α�=���F���!�Co��4<�<��F�Ñᒓ�i�<�c�)�p�G�Q�o=n��	 ��y�{_DIJ�D\�U�����|x-���X�9��B0K�r���Sz:�:������^`+�h{�' �«c���"��kU8w)X�꒞�7&$E��#u��^�8�c�y��۱z���qd�(��\�L�­ML�.bF��qc�{pgZm��&
~6�D1�#&F�� ��a�g���2�0}xDrD R^��S L ��32���(�`G�|���c�Z���-�}z�Ou���F����ѧ ��h]�:�`D��oiJCv��N-�
i��`�A���iZ=	!W�C�h��A��z��ʈ�8��KP��P��7�lx��J����.`�=�+�]���?Gf�U��ޥY_�g�g<���w8�X<�i!#f�==:�3���f��	o&Nǣͧ���L|��m�Jg��`�ԕՉϠ ��P�D��5������#S���I����q����hГ�]WD��g_�����9\��<R���5��Tymynnn}��#ue�-ׇ��~G�S������o�ТLF�wOp�堚�B�bu���Ě<�ʔ�0B=�;����ʃ=����H�*s�G�kSME^���*����?٢�dP�	]�-�/�.@'m��]�*~�Dބ���q�&��)���0���: K��Y�x�F�[��[z�b=&��sƼm�wiP�f�)�>3���|Q8G
��ټ=~��Ȗ2���5�*%�%��1��28_`�Ħ �����oힷ��g�xi�Zw�:Y�X,hO���˂��x,#\>�7�h�VuR�e�%��
��TLb���� ��稇)�!�z->jfg�G�Q��lj�rf����h���mK�V�����fa���!�j��Bc�D�u&Mz�U9uk�N��2��-=1 Ze���m���{y�0����3i_������]����lfxl������\J�`���`���:��/�"l��UPv�)	��n����U�ޕ̻��7��}A �膘n�]���W#9�0�H�i��\w1�@܇�����&N��w�k��R
�K���5��<p7��)��8T�μFq������Qn���Q�]C����|��E)8߄}ڛ�p{|�����c���%�G{��{��f�$<L���De$�^H�_N��	r�E*�N�,�ѿuZ��.C� ��W�x������m�k\��暺�s2 )C�6�}���)���)��`r�	h�(���zc��"Ǔ�Ǖ3R&�y������H�3`��;�leCʒv%K��O��-t�8K0��{T9+��ɿT�6�0ND�C7h�6�L~S�q��+R��tt�)��Qo`u����Dv��Oz�ʆ�ךB�K�{"��ڿ�7Iȉ��0���뉙��C��K>����d��x��!.?�.p�&���>�W�:LW����~ϼWm�|��@���po�� �""-�����]��|$��ST0qK2�?�`�ݕ �wr�Q+�#�Y}Î~�&5^��>*CQ8�as�e���yr�Z�&���f.�{>}6w�
��.��'t�m4A���k�Kgo��r����&F��N������v���-�
ǳ1�;o�P0�[�0۬d[Z�f�l|;�n�)�!�O����Ҭ|����V��ZTx6�Z�`%X��S���fmOz�himcQI���ݤ�w���-��̡�z��E
p�]}�^Gk�锅��!4W�1[���$Dt�.��@�L�j"��݁`�S�`�d;�����v�b^�����ە\1L�������1z����]�7�� �26&�H<�<��n����.��a�Mw��w0��#*W�?�ux�+G�N^�����}���r���OF��kl2<��ٵ�ym4P4`]ƺ #��-�f���2��ci	'2~�1;W�/�����ū�����*#�P`Ɔ�߶檓�k��ϼ	0F�l�i8U���F`���Pߡ���dIT<��&8/K�Ie�%�����S.V����8�(L9K��mwȶ��wl1<�Lԥ�[4��N`�A8�qqYC��%q6��8�R�5@���qB�ە��0�&N<�3~���a�g^������`H<3q� hb5ն@a��B/� ���k��2t&���#FP����ť8;�0�����2	, Ho�������G�kn>P��k4u�Jq��V=��*TNy�B�-㟁���k.�t2�
y����/Ʒic��G���Γ_1��ȅ�C"x�5�d�	�E�!�������6nw8�Q���������VQ��=�v�|��z]5$
�ڔ���=�ׅ����$쒰ۅ���K��VW0���e��A�rD2����������o�(VF;�::�3�H5�Ғ���4l!�D�eY����ZWs�����$�3�dk�pA�����������6k�Y΀��q~n�w�R/�R<�U��(�MvdD�E��{�C���SY��]g!h�5Q�'��7�#F��c<G7����b<a�����S8}r1u�xz;s�c+�E��g��O����w ]��"/��$�j� 悇 �G2�ی[�[�� �7���JW<W�������=���-V�-����+Lcj�i
"Z4nG��-��=�c�$#ż�B"Җ��d������-��n�2�ː\������R"��.�g�a�k��k��t��]�ep�E��tX����p ��./E|ҥ���	����K��d�~n���=2�{�`��)�M��E�3ȇT�N�G��r�%��D=E��̓9P	2�k�
2S7������#�d;���GJD>�l��@k�?��RL��I������1`�̴Y_)A�k>o��[*E ��W���,i�F��3Az�+��?3�&�B""�@����%:֨V�	V	�ft[[�K͑}���)�س�&��>�K n���������c������8|������ӵ�c��� ���29~�r��OMrhRY�o~�c�3\���g휳��)�~q����3���,�Ǡ��^?��Z�Nm'��<���;��晫¼i0hwWqF�Ŕ$���B�/��U��~�5��r#�	9�tYW=@.l���P����)��80�߮ێ���u8�u�7p���7L
.���������Ko*���>��K�SZ�W
��0    ��gZ�����I�
i�.�ȞZ>�U'󗊁�8$"ul�R�Z��;�r����Z��%mJb6����_hո����3����i�O��%��z�|6 �.��oG�{>�'I�%6�9�}��¤�5���]:��h?x��`��X���e�-E��U7�T=��A{f��F�i�bS��0�h��X�5<)���.$��h%r�Peuu��Nn����s�9��Lv�ᓈ��C�1�/��o�����Ӄ����:pz��gG�]9���C�����?������W��!���Pu{QoL��I"�F"q"W�ͭJ��yⳤ��$����B�`(b����2�"=����LT���8��"7�5)������t�����'�a�${	R�)�xAK+��6��H���ݢ���r�P���62�LC-��N5)�Rn��dv��
fB��S�)CQ���&�ϥ~T�>�)_�ĭ`%	@c0*&�F�x�;ɡ}�q3���c��.@r�)� ����_�\5�H�Ymdz*��6�)gt���D	�)=qu` e�H�Kkä����x�^q���@tݶ�O���P�S����~.\�1��&\1c}?6%�Ɔ��MCMo���{�8|�Il��,��,�t�F�$%���âث��?G\�/��4�$�u�_&x0��h�b����Q��i�t#�r�D���-$���Q����	�:`��ʂs�~.*���ly6��c[Y��rF��\��/�w��i��P�r��h�W�,�/�.�u�k��L�9Z*�Iیr�H����i�����W,��=� ��%�|�OJأ(\��p�o�ñ�{h���duk9��r��'w�GI�'ſڌ�Y����ЉA�B��ԘYT6_��c��)�c6S:_�{�J�\��>���b�l�7�����W� �� r��"蛚c�
�±z30�:���s�ȓ�O���n�e8ӆ�32WԐ��9���
|Ž�X���v�W��b����� t�9�f���R?�f*�z��P�B7��GdX�'��y(.̴݆�!�I%�˰�"�,�jl�/cvb�1qt��VT���e��tj]��(U�K�Y�{�艚-��ihX&J,�r�Lf���,��`'�|KC} �?.�BKZ/6��L!�~i�(͸�x�����I��0$�S��$Z�9������AiPn�i��q�%��q�8cS�����J�%�g��:k���Mn���yR-I��&���t㢡��~�WIyG�l�i-RzG¢����Rhh���CAJ���ы��I�9?f���A�*�z^�ټv% ;P����v����r,����,�N��pi%ԁ�Ct��H���x�-�h�<�ni���D�z��GR;`Tr��^��E����o��N�#i��i��m��d��8�5o��;��0�/���fTif��پ]�r�9��B ����G���`�Kݽ)� ��&V�^�ge���E ��Ϩ!�F*�B�xR@<�c�ڄ��}���U�f �rAO,#��.��$e��;�(��xo<�^>.��t��h)�����K6�n$�4�f�Ӷ�b�y�OI?ݰ88��D��(���dmIC%�3��(r�TL��1���r�j
n�(�o�=dܤ ��ڧ��8h���-�'����zN7�/e��dqY���DtJ��xt��.����5d�%�r�;cQ�E��P���Y�u��t<��U�޴^t�~L�ny��aCS��4؁����4��������>�t�x�'�
�?���z���� �����g�i����I�>���b�Tu��`j��m��R��:���.8-u�����ī�W�V����e-�v��-15'̓.L��s��`(B��P)a]�3�V�g�^(�x��u ���4O������)����x~h�ck/�ZL.$~z�]��N�;����
a��%h�l��g��׀��Y�tD_���t��R�H�v�
��F�8���ޯB`�k��v�b����k�Wz-iE���oO�]��&1g5�%�~!\9]�N?�J����!�
Z�QzPs�NMpcؕ�SЄܣ+�	�q
�Cĝ��>�H��2�aGC��ON���B���W�P���~��֦���N:�b�s���t��_�S��I��D��cˬ�s�9�L�!jJ�a�Wr��L���Ҝ��1��l߄�S��m�8��)���c��|�DQBn����w����	�:�j��&x~��8�|�$��mZ�*'�'��]@��- �wxp��Zd%�dj�;z��R )qo��?v�'O����w�Ws/�Ēޒt���&�;q�ι���2}lEE�0Eѓ7��7�u�-�"��5���E��x�{�k.�AuBڲ�4�G�=�F��#��H5:&�nh�aG��B9:��7�jr�(�ydF��z�bR��0�`�@���`���i9jCD�(��#n���bj��\������Y�ra�b��5�βW�쟣uD:9jU8w�9.�	xcB�Tj�Bam�_�8}�y^�4j�^�1
�º�`E��듩^���i�q%�`c|pgZm������1�#&F�5:`��D�;� 	��ц�׭�������z�8��`�Ѡm#Q�"�=f����G]�7fGa�QCq���H��.I|�"T�iJCv��N-
f��7�^3M%� c<!I��6u�a�aRf9�|�)�^��͆RD��fýG�!_��p��������@�~�ޣ��$��u-�{.H��&���Ut������� �l�Z�f({���N����ظ���(ʆ��|��=�m� @�CH��^~M�1J���@��Ж���]��y����2,n	ؙ�D�X��zU�V�1��E]�Xf̤�C�m����|7kʥ�])����`)!��j�Yj�	If,�D�w;ku���d0V皛�P�����)l�:F���f��}�t��ad�\`pY�A���8%k�ϼ�ף63�d�h�f(����$V�`1��-m�avĹ��]-1��X����:��MmHb}d�s���o����-�e�L�z�1S�]�-��>��<u�Ǒ[������#?Y+׍V3�=ӗb�ue$�B*��W�B��jA7�y���0#� �*(o����/v��N~D��a���^ps�wבʍIy%�L*�	��$ '�A������z�N�LUl���䮨�a�����Y��� �s"�KD*�5��2�dO�T1�  �&xաG!�W����k� )׀!���ה���U�+M�PJ��*���8rB$����A]�pU����tE?��E�7O<O�)lV#QI���(��u#l`���q���7 ȯ��G�����KNl�w:���Z�ol�mS�"�Tܴ�� eܳ�:j�@~�ψ6z��jC�gؚ� ����"pTяa�R���P=�ZK�R[��1΅Yk��b�P�6�*�U?mXl�?�Z4�F��=L*fl&�G�����A��t˾Y�ұ����T=M.o	x��+�����y)��r�{&=�G�o"IW#γ��l�u�J�K�o�(i��D�y��Zˋ �b��)�m�).�Ut������K�?��쥰���D xx��"_�-u@,9���#���`�s;�h��h�����g�}��J�\����\�����v�f��(��0E���K�M�!RK�Z�{�F��@l����i�v���ѯ���Ҵ2� f��`x��H���&�K�9�(��^�B\��,�r���$�jC��g�~9����Fo �-�9��Y�Z�P���R��@����p;������}=�W���uv����f��?�����{UE�0*�YW�I�����qk{�'�kC�����3Sr@!��%k���1�0hJ�\b�Mu�����Q�t� ����\N�J\0�V�����5,0´�^���#�ǓI=�����6H�<8=�z���c[G�=8=< ��&�,t�����Lc�Q>0�����[�It����7��6OJ�蔉�E&�MxQ�ś/   Z��!�$#�(G�<��#�(6}hv�.�{�/P���F���/���W�߿�"JQ�+�&3�Ro��^md��6��$q�G���]�h���[�=��:1%�_��Q[��c�t
��Ĕ�)wS"V��'.:�&���!j��cF��:Αq9���[~?��jx�#�'�Ժz��)bU�\�������pq8�AA���-�>)�/17QY�gr�HyE[��Ʃ�\6����-�-[��:��p �mB��J#�c3s�<n��}�(
�&kY�]�M��I�����Ȳh%E'A��M�yf�^,̦�td�I��������������hS-;j�û�F=�J�����B���ܱ=3�E��L�:�˝y��ݽ����Wm�d?���'�N�[!�z�շ_�>"�#r�7��]�\<�-'��e�o �v��Q����B��H̹��_v�	�9)���q�����Ys�Ft1����s�u�n��MGKu�0p���t�Ԟ~>�|<�Z�CgonHv����h,���P��U_}i(����A�#*��+�e��@�����}'��B݋T��d|����B�[gQ�%{D�&#�k��Us��:���X'ᯔ�I�S�����PJ�#�JQ��.Z���H��H<��f1){�v��XN��KmP�BWâ�n[bb�$��y$�'.Tq�B�I]�^��a�|{31ِtU��o��}'��̎"����E)̔�,�7�����a�v
~J�
��lw�V���;�^��+����\A:$�2]���l�@�a�Jc�(h� �X�����c��� ������g�i��7�~��{B*�T`ٽş���?_l�W0�>º��y�_�I�И�^��u���i�t#���k�vm��f�[#�\CU��t5?$.掴.3�$��B
��XT �n�PnBΐ[n���n<9<w��4/�;�0p�/�p�FQ
No7Ґ�#����-DOU�IJ��V��	b��"#k݄Tt,�mX���Cr�ʓsz{�#@
�h%�mHBYYFs ;��u�|��O�p���?i�Rr�o؉zi\�*���:S���7�.�k����'?g$
]b�%�>��:\���?�@�pB��E>�tf��YU�u����AWv�B9�h�]_�R���Ę=�ǑV��!���R�e�/�F�He�75���x �З��R�Y�+�����b��HN��H�a�G�U+��~�7�״!�!�Q'����9�A^���S]�T�Pu�[vJ�@�]vizi
��L�f|ҍ6�A���r��}��_t�ѹFC�P��Ĉ?!(��צ�|Y�Й"�%�a�s��z�R��|X��z�y;1纹�۔tH�!79��k���І��GR;#�H�"!�;;?�̫��1O�
��v �j��5o����"Y�3]✶E##`��� 7�B��5=I��W=�h�6��4V���ҲpD�e��p�^�����_/C97s��[�`���,g�6�W��a�05�,����c�\�ɗ�VSq?<=:��د����tx������ػ׵���w
y?}-]<3���4�S|����a��0p4��*OF$X�y�ZᜢY�
]1p=����pv���9���&2P<41���qm�7)ʤ(w�(_���iz�jF�#�T���t�}�H5��H���d�s��}㉙�婰���%n�]���G*�5p��0)��)�}��v��\�J��)�q$����#؞ n����n��98,-��V�Yli�9X���*1�Ί(�Ռxi��Ϩ������0���*�+��s�,h�ȫ�M8�ߨ�,3��Y��������v�3�.����b�s�X�seLm4Y�l�aX��ȳ�Z�n�agR/ *uj�E����D���2��2 .t5�1@��k�:��@�e޵���#����]`h�:�[��4�G��t#�q
V?l��lf��}��(��=�)')s�'Nz�}p���辄�y. &�F���(Sd���*��Cfɼ��?Vܑ��.�P��q8lz�&T �R�|,�:#I�IB�" ���&��/���f#��0V�8>��l��;�S���&S��NLa�4�������U�^D.a+��s�^	A҂G��w�M�l�-�$le�A;^7���x�O�w���Ƀ��l5�����}����F��!��*�=�+vMT�U�����=�\
b� �ӮѦ��gt
 �`(dUg��fݴ�d"Y2q��2J��Q����;X�)���v)�����tE����-L3�g�a�h��}�(108݌�/�2gˌ���.�~!��/c)�P�"I4�m� 8N��j�֋��Z��M���..kkF���d��#F�b��VF�����V]������D���߉\%t�x|��Ϗ?V*>:<8>>>:9����T�d��:��)A��git(�3���^};��f�-��B5�J�#�h��
�
��P�C|<y����)@g�z��d�Y��X��&I*���C!G�kt�A�@��G��"����R�"���@��3;U:�	Y��0Ϣ\C������J|[J�-&P��+1'�t���Ob�f��Y� �;������o-41���M�A�>�(�#��>2Cܬ����k�G!;@p�i��ݍ؈�O�P
8"�`�p	^N��7g��L�:���ߏ��O�W�c�d���I;qX#�	rź��󥁂�y�n����{GGĲ�G;p����{x���������������O�����      �      x���rG�.x?E����B<�:�j{(�msZ�4�ܚ��	F�*�YUY]B��D�;�1s;�O2�[+�� R�[&@;���_
YYY�|������_mմ:Sߛ�jmc�����emc]1��//����}���<���^-t��&q�Q���j�PZ&1um��g�6�ԪpK��n*ݘ�M�N�t�蹙���Y(]��{gs�:[���+7S�j�kje�i������tO�oe�T�ZզQ�S��hu��p�^UsZ�'��Uf/�z�|�4m83W��s�����̞)�43�2�JSYSГ���^�D�Mi��<n⊦r�r��ca+\GO�Pt9mUg{������[б��)����돥~tmU���ك�����݈�_�N3����{ߚF��Mf�ܻ7�?�4uR�O(�Ŭ��Jk��<k����-�ԋ�l����?��������q����f5�l�޺�r�Ĩ/W��mR�.���2|u����^�Г�Q��۴��g�
(�k�����
�2W���jL^�JW+U{��D�-�����ݴ�ha�_�RS�\����ވ+�^C�$� �we�oG-m��a����.5í�~�<sS�e�	�L���$��en��Ǚe来G%��4=GN{$��E��)�f[ؿ�D/�j��&�A��=��ҬTjg3C��X�8�9�)��`3Lt��S1��϶IG�#��Ӷq9?Njf�0�Hw� 	Ҧ�o�%3=+���`L��dA�c�&29��-�x-;����%	B|��K�x��ۆ��b�+k�̋��c^C���g��tj�:]Ok��<ךz�N�U�,*W��&�L��r�?=��5�[[~�DA��mbD$��g�������w�t���!`�IM�3U�+��&�*ի�V��p�?=�W��Y��t�_��4�/~��>S��,/J�0�Çx�5��i��ϲO~SjM+=k��T����o<������^+3;��YI���̟��-���6{�y����K���i�8�/�}6%R#���^BtP�T�駇��c���gS�n��?ћ>�ҮM�G�|�_~p�?V���3�{3����yG�r�j]�{5���|M˙��G��[=)��u&�\��/�%��o�"�s����.��/������e�!�٫KV��*b����&O�d�,�)˓���C�?sUIʬ>9��ޝ˲���'t@O{��><:��n8��Wr�$����h�zqBҡj䃔�e�B�߁���ev�[9��}KwH.!�ׯ�EJ�_6�M2��!;�H
���2�4�ڟ�.ѵ�sm���ϖ�>����%N4�0np��/I��\�Ow%�gN�� h���Ya�$D���t �T_{Eڍ�{��{�@	j�,h5C���)ό�X��*��ݖ���l�3��Ptf�ہuI
^�b�f��С����&������/^�\���'p	���>��ih?�b\��8�9i���H�&)��5�6ζ=���|���P��ʛ9w�	ǃ������#�zE��%�E�hi\��]�{�u�2���ܑP�aCʁ�`�d��!���꼓A���&
wC�w��pRl����VL:�b$������`�C���@4�Y#Z:��9�rm��+��a_�i�y��X�H�q��\*��4q�$��?���#�G���?��;��_����X?����^��et�=���>?@$�_+�)���^��X�CO�Py�
L���%wZض��3D׈��[��꺱��7��\_��(0o�aW�4&�/07h���&z�~�� ̏~Ϣ<��⸳.K�+���ә^�g����Vcca�4O\1�)n��eE�ۂM�gNb�&�k��%n�kK2������K��$suT�D�<^du�!�ѥ��K]���4�
�oj8�T��4JO�m#�`$L9�i��<��%y"�#z
�����fP�5o���%��x��؇5Dr��浬+���?�-�.��Ǿq�"��|!��5���7�:0:x:�%�@�c�\�q2�����t�g��Vja��ߚA��6���G��A�W3u[��j�0�ɾ.�)�c탊y[��+!�]�A�Q>�wQ�D]u�/�5��C��� �z��N�(-2	2#5,"ֽ72�� b��4�K+Y
	�/̊��f�� �x��))�|$!7�^yQ�DԼY�b�84�M�����Lֆ^0��q��k�}�oy7G0؆o��R$Q�DA����D�p� &���Z�Z46��#(����B"\�+��EA̕���".���i�fO���]�3VoђmY���̷N|d����!0�6X��Ǟ�r�˹�$0h��N��20x�13Qύ"��l�E���<�ua�&��.���iN�w��/��[�'[b�i�($yxy3�"i�pJ��86re+d"'�*H�ٱ��O̹y'��1��g�Ϩ��/
�(�~��{��Y�z��&���ݩwO��9*y�}5�`zw�:ӄ dY�:�k���k��%�77k3�_�!�},F��WH�oH�ӻ���O�	��bk�]�m��GϞｎ���O�O`�|+��Ij�N��y"l������}"e>s���(}Q�*�#�W���P���B�܊��rV�
bT�x��Kq�ͪ�IYedV��U8-�_��gj�q7'و�Χ+S�J#/�'�:2�C��H���P/5H�dFC=�h�c���%�j� �.�2Q�G��5��7r}���u�Tz�$���>bpq.*�
���z]�:��Crw��j���e���cj �P�د�TBx�7&MgDG8���;"�b�"Kv-#�Ef���U`�#nŊם�IY}�����р�ƦYk�U�W�o�m���J��aw�E�g���
��y
@T��Z���ӽE��?x�\.'�ť��O��{`t����K]�=:���Q� ����P�t���\�F�7ef��LuO��M�{�L��>�N�R/d�g��R 0G�A-���|U�-���v�Ј�Ȩ��o?VUK�r|����/۪$>���ψ��K^�k��K�5^����C�FAv�O��Ԁ8�'v_�k�]�h]iz!�؛HȆ"�>0}~��ッ��''GG�Ǐb�qT�;�c�q�ݻJ���8�G1�H,?��	��Ќ�Ǳ�8����k����Ǳ�8
�(Hv^����X~_|8�ˏc�q,?�b=��X~�-2[,?����X�ˏ㻏�ǿ�sW��ht�K>������`tsR}T�������g�G�j���u ���J:�W��{�w�y��P���'�_]��Y�t#�y�J�ם;��~���,b�E���, �>����=�̵H�o�\�o���!�%�_���]��\a�QJT��R����ϕwD�o������M�q�Ã���~�'�/�UAz�$UiZ:���1���o<�n���7�ƣ�b$��G�+�c�x�hƌf���&��7�#I�(H� ��$�����JQ�E�_��}�o<��(�c�x���vW�-��G
�}�w�w8���q�}����?S���������_�壋�.��%�6>���_�iT�1$��Bb1�a1ez��1vkF����i��'d�1ɢ �WgEᮘ"F�����I[����Pg���w].�[C��>��7c�+�a�N��������6�m��{_,&,1~O�o��4�D��+��s����tK��백z�շ� �@��2�W�Hi7�i3k�N��t���<if�S���6!.Ip- �^�$w��X���.9qJ������A�
�>$6��'^�����)��\LA����N�U�|QX�}x ?����#�s�h��\��8�-��l��݂/$��Boc���X����T�����L"]�-a�-5	�31��$$u��f��Y����`:m���+$��+k��-FF�S��/�����$��c�
`8��dee�lf��X�1d��h*;m�n�1آ.m���]B�J�&�����u�lN��Ӽ5ۓrr�����M�(�    zn�f(�w"�B��ԡ����/��٪n�K��L��UH���	����?)ݦր02�+���(������^�}���0��צ�қ����-![j�1��=z�d�$�W���� 5�߰g����AC�y��h�����2�RL��gSđ��ɘM;�US[ѿ��~KO"��]d�;�3��	�ŧp��$�U��Gn��Ff#���E�f��VO��1'�Y=�"l��U��ka]��iE�O�t�C�{5��^I`Ot��'RĤU<:xrp���h����8u�h�@�
��{
����).P���Z�?�r��wQ��O:�����13s,%z<�O;��w�Ҷ`�̮3�+P9HA�N5YuhT��?��{D^H�����X]������?�J�"w��5=v*K�L0I�՜;�f��S��1sp�1��ͳR���A�����s���"z[�ľ��X�lL��ʣ������`��ڡ�%4J�M�8g�ԏm����S��͌�KZߝ����w��9�Uh�����u�"^�j�.��*�lܖ�t6��Nˋ"7��i��MizްO��j1X�!�ֳp�^P�ο�Br�(�� 8�h�mЛ2<��Vz�\f�<|��8=��z��#����ѷx��umuN[���G�C�h�u����C&u�.J�(:�p�/����kݞ^�x1����¬��bl}(��@���yW�')�T!�D����晛�>�ɳX�!���F�]��i�c �@�_V�v�&H����3uN�M�"vAO��C��-����^� ��a�ǽ�Vt�@!�b�'�!���J�NB?!��O�"˭��[�TW���)�:�߇��)���N��a��M[��	샐_ _H�&(�B=#B��>�Bƴ���[JI��D�����KƳ�?�{�Bc�����V�ι:��Y�N�)I�sΌ�B���Q�~��߯�!��$ř߶J���h	1_dW��w��{Ω��t������cf<����}�S�c�u�B��x����F^f'ww�E�t�<�4�1�҃�,��,�
�@�~hw�_sH��8�;�Ӏz<ӄ�(��ֈ�L�G'���&��·E\�?:.�x�M2I���Dm���I��36��lմb�5�֭;[,���go`�r�Z@W��lA�����/V����hd�1�DiV�Grغ�T�68t,9H}��!q� �A��Z�MȮ��������ji�w����e��8���`��mgUN��&����~AB�Wy)K���\�g��y��FU���1�!ֺ�Z�ۯuy�ι��l�]#R�v�4����}�ʻi��"�X��D�T�Y�dGb���WL'�("AF��xbX�O;�PB��<	:�P!O>�&ɒ�����h�w��!h�#Um��7`^�с@�)�.Z�{>>KT�[�5X�Y��\yB�^���*�E��2s��q�r�F|�)^"]Hf��E*)9����?������o�J'F;q3zP�G���Ґ� �����"��ue��Q��nLβB���m��B�Z�6��������%x;��S�͹�9ps����R�������P�Q�`9=�f|52>�	|�6c�;�&[�EA/m�6��Ó��ׇ���zo��ʴ�����a�ԍM�ѥY]�[a�^ԃ+�����2���Z�N��e�*E[a�����:[o ��lV���ك���#=�ΰ.4d�^{q�x�L�f� Z�(8���p��P�f��|�7R�r��3%'����( �Ջӯ��{=<�<�x����ΐ�t�A5
�ן�-6fPP&y�e1�Wғ ҭV;���I���>?ꋯ^���S�N�Kπ//�h��|f���1��N��O+n��Ы��� �p~:�_������������f�ι\˕�-j�F��{�R�I��^���_S!�S�B��Q�]_�!o�G6]"�
����NF�7�W#K�W_��B��=�r���^!}��Mʶ��Gݬ������+�x�y2$�c��N\._R+Ze�H����,����`�R2�&�[K{�/�O��P�|h�y�(�B�mJ"��0D_eK��ے�5Dp���MvP�aby����lH+��ʹ�����y�M�Z^���� ���P$�+�-�:���R��8��oﳢ���� y�te.���7tC���aM�\�D\�Ҽ�D�i3���%N�����ߚiW��>=}{~�]�aි���
�@�ʈ������w�V�VU�=�ȕ��O�41�(�˜f李�A��K�ӟ�AL�M6����	U�b
O�5A��gN���O}`�f�M��D��!V��ݵy�ԙ�[> L,g�a�sF}�bRik)��ⶀ?�@���"�|Э�"��ۗCS��dI�np�����bIK����]ڽR������ã��d6(}�m��<�P9[�_\Wd�����$dSn��~xrx���=�!�����!���!���l���E������B6��k�Wj�{���E�?��ǭdZG��e��+|�-�jXt�"�6(�C�k�M�gq?�;S%h��=vO��+NT�)��u��:�K�D�+;'
�-��>�������$^4��s^ۼK83���#�i�����SKű$ 2�֘�h��{yV$Y��E�9�9�����N";�������
k�!c/QB�dNߐ�쿐d�h�My�3�6W�����@��+�v����G�x��o�`�������:�1ٵo�G��%�+IEE���9��_�m�����%#���q?�/á��Ґ�pn�Fh�~�v�_5�U��8�0Y	��o�ƚ,���k5֏G�d_�Q8&w! �6}p��X.�\��(�#�_
Z�*�מX9��YnO�JBF�N��� ��|�v�%��{s�s��ꙭa��S.�̏
0b��Jx}�^m�_��@=.I'���Y*�RD�&z��lǡ�%�}�h]}�r%[��a�1=����7hS��Yd�m���;m��L$���(�^w�u�*i��cf�]r���6����#s͞��۪��4tQ�"��Ñ����O�4��~T����IǓ�^�3q� F�i�!���z<g�[�g>���^�3	ʑ��=��:dON$�МۘR|����yDn�ܾnz����@��n��
m��ܠv�;�%�)q�l��8�?C`��a_e��
&2V�ݒD���WcB�5��`,rOlC�D-<(�E�!�En)v����h3v�dtp4:�K��\w��-ر;hNX�6��{3�=�Wz?Wb�x�[�Kܔ��ұ�������R��K<�W��d!����L3�K������'9�٨fo_�~��<$���k������7�K ��E$�H�[�"���Ԙ=O�{ch�f��RS��	�a������;�k�	���kؘ;ǘ���K��6��{O�������6�]!�f7���\Wi�e�L&؃�fS_����z���w��c�K�w�L�cL�]b������)[ba_�0��O?:܏1Q	�e%+bbELd�;Ƕ�"&V�D��<+bbEL��?
�Ǌ�?DE��.Ě�X3kf�"��8��DR�Ñj��ن�u�j�x��!V�Ī�Ȕ;ƔM��zbaM,�����ON�o0���R�|x40���&W��*ݣ�M�Ȕ;Ɣ��&��1����RrR2��c����M��-��n������knm�Ի�G��վ��,�3�\&m�/F(p����t�YTQ1lɧ�uU�Y��[��#S�˹��gVt?��r0�b��%Y��=��xv׉�m� ^�x�6���zr��+�K�Uٸ��ȔLV�{�-;�n�v������!�l=�d\Em�=���0�쟂dT�h�%��U������;X]��v�)مԴ������X-��Ia���l�3b8������aw�l�(��d�]���X��i�X��.�aw���\��ǯdtEM�e�}�axa��8t�s�?<z��C3��s�	.�ʦ?����Ӷ�s�P5��t��B.    �W�!�ð%:�F�v4m�ۢi{g]�����,Yj[,��crK�e�l%�N��,K^�u���jR@�IXU�����P�Mp��kY7��
�7L�*�ۆ�f&�s�+ǽ��O!���IB,Y�!R4a�n�}-2ږtz�wfH�3��K�|B�_��h�v�j���/�DV��<���ɳgrQ[;7���_�B�	�3N�Ef��t���^Ս��M[.W9c~��d�7+�ph�!����d.i��K/I�C�C�1��æ�.�B��(�p�t�7��
�����$ܛ`��)�ex���JG^	����@�ȥ=�6┬�CY�H^9/$�E�Юj�A�8����D�r�d@��,`�AT/M�%"�'�1^��H��$+iC�δM�L�a��Ʈ��m�����M�DC�
�XT0x�if�yd^�d;-6w�m>��>P\�r�����L��X����WH<E����G;�+��W$sVCY�-9g-6�G��#?�7
�nlbK�s��i7T3Gr������9��}�1��-X�� �`�=�&��O#A|Э��._�!od(=�%^�c�7������ҎFN����͘����O_����W���\�C_��4�W�;���i+�^�u-�����t+�J��+�&����fD7c�52��{z���zn��scǣG��؋�hy�K6>���g��O�'Z]�@�}�f�ҋ�&�gI�H�w�A��`�H$����C�L�+[5����X��&�&s�"Wl��5Q�m�8�I
�h���\�����?4�Й�q�+���%G@T*����Sr��F��Hj�r��_.��L����1��6F�֣k\��\8G���͹ື}�0z���v�5/qOk�ў��y�����*����'���I@@�%'��
q6�ɵM�#YF|�Tbu�&��De���JAP��ͺq�=t�X,��O�0Ә
W�Ӧq�,�-~���5�w֬J9}�-�ʊ���g˺ &#��NIEz ]�uAP>:�-�
^��f�w���Z��-u��k���Ht�lD�b�ו���j@R������b�鳑\Ԥl�f���
>�"*�8xj��ڴ�7�|T��� 1U���.�V�>�N����VN�"�A����,�:K1���י�B��6�g_)^�K3��:0� @m.W��e�,L�����V��2z�s"i��uI����:ZOj{�� o�wE]gIӉT��#��J��#O�6V���]�X׭D>�)����Hã����贯8�� ���̣A=�]�)\�b{m��m�W��ou���R4`����|䒪�z�m�{r�H���][�Mi��6i�ɝ�t ץ��\B�@��,��K"�h��27��Y�zl�H[�1M-v���X�3�C�6`����߹��e:&7�Q/`���:o�B�{�I�.�	�p�`껛S\�2]�oQ�
|��d�I�֓��,�� �ϝeę��l�*C�l ��;�r=!�c'���_��s�øY�Aݛb���ki�����E[���+Y��� �h�]��֗���y���o��n�#:�}����k�B�c\^�M;)JD9�x�ܚOj�����_ٛ�4!��{<��2��J{U��[�̎�O��G�O�eFv�CL�!u��7tu���(�k=J��t{]���L����f��$��D���b�A䬭s�s3C_@wMNO	Ә�|%��:NT~��g��Є�ra�&��
��	PF@}��L'Eh̕b3޼�`�J�}����-l=���B���M�~f5w��I����r#�h�s��Q4e[�P��70��E����É:�s�ānc\bݗ~ETp����^g���p�e�E|���2 m��/����kBot�H�������$FJ�~�O�1m�/я�g�v�6��=8��Z��������W��⁉:Y�4�i��=h�E?ܔ׃P�*��xQ��r�vD>[��I.~]��a@�}�B�E��l�l���G@A �5��r(_����:8Qo<p��=s��f��+�����NՆ�+D\]��;3�`�o7Q�D�4����!����T>��"W��h�o����6]���&'�4��c�}ʽf�O�Xvb꜠�1L��o���h����OF@��wD�(	]����;���(s�j�5����#��	N����k�ȫ�W�V�Z�K��\�Ή�SAz`��#m���bL	E�=REG�!��B�3�]�z�����b��@��P� ���%�'M��ڪC�����!�]�A��Ƶ�m��K3��q�:h��	�A*�G7�/��YF��.*�_���]�Js�ӣ�Қ�g?"��b[g1�֋��K�qGJYB_��Sm7�d���ʢ���ˠ$�� K g�E�ZҐf��a)Vs�N�wC54�'�	n�����?O��tJO���'A+�0#�	�S[n)�z|��v}:: ���ʠ���pf�qT���17�[C�QlE�m�0���R���uSH�q��K�F���1�҂�KtkJ6���a���T�c��Kb�J��M!�OH�:57���
�yR���xP�v(��T�|�H�k17`�f�^cst<־���L*�6Q�Ã��"��<0�o��BKgE��򯲖ɤ�~d -@�!Ϙg�H4�5I�蹰h4�#�m��N럯[��h�&z�&���Y��ޒz4�A�A=Y���iYPB���[�4M�i�$�*@��BM����,�#�P�CM9@ ^q��y �2Qo���8��Ǵ%�50�AIr�G�e�*�ߗޛO*�MѮ*�3}xJ�Y9ff����l�kd�����c4u�ra���0�9`2\%�V�?�u�I朠�8uIO��Ӝ�ͣweoɎ������<���d),J����ǁ�e}2�3�2!�F�
h_b�L�-�����~*BC��Ȉ�w �6R`���4u�A�W�k�7�c*Ro�0�S����P�W���F8�Y�M���q(S���_��Ӄ��ن���7� �4�L3A�E����;��
 	�4�Mj�WHu
����LSߎY��X�DD��T�B1��K
}
7kJ���n��폞�FF�g���b
5�/.l�ų2�Z���Z�L=��L<���3� y:9ױ��	���zN�c��fm����X�����!=� 0�ARu-�*@Ǻ��Z� (��S��6	S�G�@.�	�P��*!��k����g Bib�Wě!)0�5�A҄an���|�qS�m�qV�BA�jd�b�_�����X'(���lY9L
�G�A')$qy��a�N` E��e$�M�+��â�a�-m���/�90t�\c2zt��OO�����:�W
����
v(qR�f͒�B�a\���Ox�x�o�*�+e�N���P���<o��0��F?��I��F�If9)2?�IL�ꃹdU�������t��'W�C��%���zlr�;�-\� O��n��UtG#�
C��|ʣ�s��Š�|�`��c�żE�������~���}�7���x}{nFj�;�KC6 ������0O��%�$p8��<�m��B?Ü�������%�SZeH�k�3��ߏՕ�����Pr`g��V����Z�}���0Y��L���r���>��ϋԋk��1\�k`e?��GG��}8�T����2>��n�M�8�ã�Q�ʋu#�BۋW��^���L\��w�C�I�|��M�3T{�$��`~{` �[~U��^g��u����h��OjE��)���"#�jz��]J0Q�Z�;T�7�j� %��T��<�� �0%Ӿ�3�XB7ȥ-��`��8=�Ȏt��u���i����V�:w����4�Å�����g&�K0�2�l�����{�v+���/��s���Ğ���
#�+�`~�����[Gr�������R�ݐ$�O���H����f��o�T��OOߞ���'��f�D���1eo:����;O��-H�ʏ2�9��J
���vGRyO�ګ��)��:R��z/�O"c}@6����v8����Z�i    �A�>Ht:��=���k5Q�]1\��͛������D\ ǹ��`�cN���1_���{o�b>��_�	q��ˡ��q�u�^x7�������`*��G|��*5��}�����POy�m��]��sO,$I�p6;��j2������"?=%��nu�A~��d�ؤ>]��Fx=�b�oz���ٵ<��&eyz������A�3�q� �>�ΰ.Hp.�Q��P�E�Dɐ��IX�bh��vt8yt�<������������'��t������M~���u�HȮ�����&U$��^1:�������۪����g���$�'���/�zUK>A�9&8���.��
%)�3�J2�7�܃�{ ��$1����a��8?��"�z��6=�J���H��y���L�`!9��2����ބ�J�(��c8��c8f�b)��c82pd���������	��ӏ��4�
��4p$������1��1�k����E~��1����1��;���J����Ss<���]0�$��#�q1��\��1���~i`ۑ�_{be��S�+fԤ� ����_�B,5&c ��@��SG����NGb�����C�А4ȕI��j���w��4F��ə��$I�}�h����%ϭY�>�U�F_2�Bn���XaLZ��!u��!ٔe$�#�cd�-��㉺����D�"׊c���n�(0iͱp�eqFz�n %ͫ���L�J�z�<q����[��'w��y����o�����י8X 4��i�!����Q��o�])m}I�戅�b���!��W�q�dO�" 2%%�C8x����۷��O�4���ap���@���|2�\^ZCq������kZ|5Ȝ/}F}�K���t�Y�ǆ���ɯ�Y����pOlC�8J�����7��sхG7����GG�GG���y�j�9������cyЭ��mj�/#���Q�a�O;�8��+L�f*ӽ�k�	�'�+��M+�T�W�U�6YH6ҡ��lP�<������dl���QGE���F.��*�&a�tS}��!�M���-���Iu��Y�r	&Y�잚���<i�+�Y��i:�VS[!��m������d3Q,��Kh�\
;��r4	��&�z�j���=;����F7�����[e�J�ux��*X�;mu=�t���TZ���^�E��a��D������|,���k�ī�Y�y\K#S�����ag�\ ��o�Q\3�]q��4C� �'b�F�7䯓I�Ǖ�,H*3�|c���<���\��fV7٣��t\��k�w	7<�g	]�j����΂�9wj	�4�y"Sn{������#F�O�����b�3P��g��>T=
�#c/TB��\F��\�F¥%�bS�\����dfU��I�PH�+#����m*S�L�~�(�����J�|
I����aQ�u1B�t�bGYIz�Bv�;��cJ|���K���Ŧ(���R��a8�4R̟I��@�n���[r��K秱S�n�C��t�Z���Rr{�c�2�.���f�sgݧ�c�s��\���%��B���/���>��"��-y�>�G��ڹE$y�<Z�k�Y��C�	� �*�j�dv�*��?��HNc��� �θA�{=����%ժl\�Vd\&��=���i7C5c[K�;��\ڭ��T;��ߓ�8��C�H����Ĕ�G�iK�Ay!ӝ4��e���U_Hʅv6�(�f��Fz=RXy�a/���T��� ��;4���&u�kO�Yꙴ��NE���Xk��vr���e\���5�O����*�4�b�#:��9���ߡ��F�l&H �ʦ�o�MS�i��0�;����� hUb>��Љ5"ǣ�%���;��8�ӵ#Km��zz(
<~:[I��S=�,�PL���Z�&��ת����׆�m��kY7�P��7L)z�ۆ�g3���Po�&�5/xz����j��"�����q"�\d�-�.���L��3��K�|B�_���v� a2H�(�4�	��8y� ��&��s�w�F���L���p�~(�o�7�<�'�s�?��$��Y��CU'�L�\&m��nt/,�$��(����7���(\*E��x��d8F�NR�5S��핎�.,���;ZheR=gqJV���6�iH8{�4Z�qX)�d|���_Π��L<��t0�EG:c�����9IV���!�i���������m�����M�2{�
C{)&ȼ�%�vZl�*�,�WԠ�Z�[�5�9�ƻgl=��"�|�����J�d�ɜ�P�xK����(_�Sp� o0��&�$;'ȜfpC5s$�IYPA&��OEf6��4�=��ǡ�ܤV�w>���9��u�FP��b����@$o��{K�49�+7c�ނ2>}����_u��sa}q~<�@F\Ho�H�����[�ֵwop��ҭ�*�b��z� �݌�fl�j���e�Ooʋ��ӏ��e/���}�,��<2Td�m0�w3D����1(�t�ڥ�eO��<��d����֑�؂��9]�qd��1<,����ǲ	��(�0A�M�s�`����$[M'�ʁ=�=BtdТ�q�=���%�K�  ���Sr%=���߭��/�����ܡ�d���m�oc�m=���1Ȏs��/�ќ�{k���X�ok���F���ܓ���I��8�< ��]��@4qڝ�"�\�+c3\VR�ޕ�d@������Pu�*.��n��K�!�8a�1�4h
�Mˌ������k$"�{��Ox�0��d�?�B��B�L%��"̀@P>^�-�
!_��fx�{�Z��-�M��k���H���PP���W:Y�BJ��2��c[L4}~R@1I�&��@bj�8����ڴ�7�|����D"U����V�>�N�P��WN�"�a��g�Y��x>�ֿ��S�J���"�yi80]�F ���z7]Hв0M@��0[�����M����%]�b�hO��'���ߕy1�5G˥��M��kژ`�K~��aFy��`�xt0:��pJ�Gv(W�A��]й\�|1��0W��t�+�W!��-��B�c�>�y��* ^]��[�N2��(�G�VleA���M�ah-e��+-���Y��$˅�l��wS�nR\�R��f�n�y�D�y&�i��N
�!��Nm�.�q�ya/`����o��]{�I��CR˅�nN�y�t�n��)+d��H$Y�$�B�d���Y�/�,5��+C�lx��xPY,�>!_d'���_��s�ոY�� 0łK��RU�um	����SW�vWB��&��P��/���8u����7fu��7j��ąpи�{R���}�����wS��^�+{C�
 ���5�KȚl+�U�wv8:xHxR�P�Cwث�b�֣D>�@�؅�?��p��	�HvL�{�,�(D��:g=73t�I�����0��YX� ��D��'H���_x� ��a��� Q����: �-}q���'�1�����j�\ڌ�B6�꜈��|�E��#?P����!�#��㫗mU:@r���x��x90�_��'�,�[���,fz
�rTp����^g��� �e�E� �?Mԗ�
-�R�ӵ�7��m~~� �tp5%�B�u�'������G�'w�u�1���q�r����d����ʧO�l�F�����0�[�z0+`[E�/�_�׎�gk32i�ů+73A���C����"�m�;��
(`��N��W%N@D��Z�'��S�g�f#!����a�ة��Tc��c�f�����&�ᱢ2]u���/�
�R��C�.�rVC���ٵ�|orrMC�z#�h}Z�f�OP]c꜠���#zn�|��d��� ��}��ã�Ю��3J�E÷v���b�6J���M?���iw�Ӣ����?�j�ը�V��%-W�s*�T$�<���_[篿SB    j�����M�O,~dC�¶���L;Dw�X���Aw8�+X�!��c������C�B~X]�KB�b�#�q}a[����DG-ࡪr�z�r��J��M��+k�Q�E��J�W+�s��:]��ت��?�Q�E�:�I^�^��^b|)���#�z��j��)�ĜTu.�%9]X�9+((-�ג�4�/��F�C͑:5�QԬ��&d��$C��<���)=�N`�&�x���A�ʐ�_�}8: ���ʠF��pHfsT���1�4����Q\lE\�m�t���R�E�xSHWs�P�F����҂,LtkJ6���6a����c��KLS�ssSP��N�V3�B��TNpAT���z���+F�>^L,��Y���������r2��G@����$��C2�e�����a��u4�"�F{�W��dtp�3 �ސ���$^���X�\X4�֑۶�m���׾�vg���=y�I��Ь{XoɊ��
=p'�䞬�N�C	!�Co��4e��?Qw�55��4��H�!��5�X�x��# +��D�]�Y�,��0�� S%�I!	�Ԫh_�o>�0�7E��s̛�,�娚�f�6�MT��ݷ���q��ʅ%
h(�p��p��Z�C��'�s�.��%=�O�2#xԐ�ٽ1h;p>A$�L2����3��(�������T��ʄTk�*��!�=�3���~v,����1�##FF�,�H�����_��>�yL��øQ�v �C=_a�f+�vd�7��6ơ���2�]�Or��.���c�p��b�P2G5-�R�lN�*0'���7��^!M�)�7�^3M}Kg�Cl�'S���TD
�`�8.)�(ܬ)EĘw;�{L_����^�� Wz�u�w䁳�"���"�W%�EA�6٫+Sy`C�gf	L��<+R����P,��И�Fl�^��������Nd:5/P�s��{#��z�y�Z�>=;���}�Ֆ�½2�	f��Έ�e��'�VI�g���,c�3�$����������\���|�)ٖ�\~����h���^�D��L��(�h[��fe���%����X�1�	�q#�	�_�#�b�1B1��������ъ���,ed�~�SF?j��i���@��d7�ϊ+4�Υr
{�ڂL���fڏ�fSǺj�NչH�`đYWx[j�첉����p9muA�k������O�y�|�(s��/�p6Y�t��D|A"��SV@��s�.�!enH!�м��]f� ����Պ�B�����ބ�̲��xG�i�� ߚxŇ����#�R����89�7�0��Q���7�AcN���Y�P9��^qT�\L�/B�nq�y��ۊ�!�RY#�;�o�Wewp�S�ۻ��t�s#���p�&�QS�L��-<��	I��}eS �ĝu�ek��ϔ��k�B�Z�rQ�q�|2�}���'@��\�03%���&�6�`���ϵ�i+{�U�[��劗	�E�ܷFJ�����U����ʅ릃�eA�j�C�Z��/P� >�Z���-�'�Ju�L�Qt~����ޒटew��7�k�U=:�rs]�Sȱu�R���ݼ�������`�ȧ>I�V�� �63#'w�g� �9���}'!�MfG�mlfk?M��cI���܋�9SpɈl�z k�xW��[�\�ju�m��T���.�S��!d!?�Y��^l�+c���Z0������"�9HF���'G�N��G��Q��G�F���-Z�7����%}~�zmm ���W�z��h�n������qg�������`�L䇷������慯1��*_�9�Y�G+��ؘr2��T~�ʻ�S�*��'�#Cp������bq�qgŜ��s��uO�5��h�+[9u5V�>v��Z�M0����B�e��a�;fGy`[LJs��; YTt�F�=�5����d%���KSI�	Og!@O�U1��̜k�9�Y�g�Vz�����8�C�R���!'�5�6�#ڧ�
s\�- ��gLk������c�����e-w7��23.����o�x���i$��b��#���C�br�y�a�[�6�Q4@�L���ϵ㑇dbz#}��JM)O;/v�3zd�L?�a<��N�ɽ�?`�?�S�D"�0�𕌶�v��0.��&���~�}���>��x`�[��ǝ�q������%r�ɊTHaMF�*�-)͉q_����(�d@�˧}�5��O]��9�4%�sM��ج����%��Cc��ۚS=�U��1i���nx���Ҥ�q�:�0ؤG�y��U� �qefr-�aW��<=$Y:�pH�i߄��b?�)v-���꾤ӎ�b��n���V~Zz�������^ʗk��8��p��!.���*� �d$��["ID�>���c��R3�k�C��T�>~Z��+]4�k��׫�ɚ:�B���z�c0r������a�gE�z���>5�d��&1QL�A���lV��R��R&�k�E2$]�H�ZeH���#j�'��*�:ß�݆A4�dC�I�>�c�g)�l]�Q�R=V��,�YO4K� -�~��}��	����"Cy�y4Q�1��*
~�=sS�����@��
St��`@����������� ���pHz�K��_ű�]�i%���qfh�ݴ�b$�.K3�L_a!F�hrz��@�y^�!f���Z��C>i2��@_<V{�ja�B������<J��vj{�#�y�z������!�ʿ�D5�N��6��:��k*
�?�uk��L��$�lm���b���
kn���P�6`Ɋ��������#��iI���m��Ni� ��50;2xy݆��=� qiZ���2��4q{P�@Ϧՠ����/GO7/�c�G,��=��.����rǘ2vy�.���en����#vy�.�m�F������l��]��#vy�.��屋]�M7<>�<���7>�����@bH��0d��} �$��l��bH��} �$���G�>���@bH��} w��bH��} w���$f��G��i\��T�i���3zmD$E���W��{�-�%��R�{�w����e�!ny���U�}6˜n�x㖋g���,d�q<����D����Kjw�l"]R0�g���WM���t@ҷҹ�� 1���n�t���Нh�y�͒�wn!����R���q3yD�0q2��,��+Z���'\jU�i��tz���c�$��%'$u��oT5��]���ן�E�0.NnH�J��fU�ˣ1[����N"�����?�$s��m����޳X��{(ы�g��,2�1e�=��g��,��(sc��M�g3;G.4�t]����i���3��U]%��h���`��e[5I^O�?�� ���p3�}�����S�9"������*d����b�[T�fc�[lpۥ��n��-6����(������������8b�4�Mc����7��}t�o�Q�*�2���(<�u��ז�X���F�ї����H���H�}��R��5|Do�NI����xD>��}��*i]c��0YX�i�?�k�%����}��|4T��e*7,+{E6��( ����������6zN*C���7.&}�ޠ�wG��z�X�gJ�#����E�Br��4A3�F]u�Q��E��x�Ԕ��ah\��B�TW��Tզ��2�+�\�^���'��E���ʘ��j��sw��st��PC8��x51�o���(�ik^C�3t�Hk�n���%�7*%jO�uW�W^�Ss��k}�Q�Dr����*��k߲�GT[#�@�"!�;=?��V�UcrZ�*��6�<�\�,Q�6׽�/}�"�i�s:.���	�p}Z��°ơg!�MԶp˄�A4A��Q�*y�Gt�Qr��4;c0(nB�j�ۛ�g����E��C0�|z}�3zk*�"��b��++���Dr���*�x|rp|-�>���È���"V[�j�0d�j��ÉXm�-b�E����v8    -b�E������"V[�j�Q��Xm�-b�E���c�����~�<n���㓃�뉘����㣈�3ÿ��p�U��J�)w�)#��oE��JW)��(s#�R�U����ǀW)*��F�W)�*E\���q�"��]�U�U9��g)�,E�������8E������I4�,����O�8KQ��EF����u�]�؈����c�Y�=��_�>=��"�P���Q3�����1���KTg��֪0�h ݹ>(�N�|?zմhcZ�f���w�8���7���Z��>�C�d�%� Sc�>�]n����Q��,U�N�%�=�J����
�0F�����#��1�a������NŎ����Ք�6�NH�$�����b� � H@��(u��ڊ;��fD��H�}�-�f�WFd%���������,�{z�tttx|�YIW:��e-�����ҁ�5Hַғ_7g����N����`��vFB�4�R�ĭ��5K�"z�}��#��S��0}M����z:�d�XK����k�B56
HC�
�o~F������?R�f��K�Zʐ�y��eCk��36�t��-@B��"aR��"1�E���t����`��)���T(^"�`�2(M�1���~���}�Z�N�v�f��f��u��n^؁m�]���K� �x�AL��X��"Y�,�/�N��������
o�Ä����_��+�	�]/*D#ma2`�����'��m�&�#'����@�S���ݖr�����5o#|�^E�#���>G�9���{4Y��}���w�����|�i<<<$�=�?ܰ nůyzrx}<s���5�G�Jz�Ju���8��\ꦇ�85��X7./��hp5��_MNЅ\�{�q� ����+��蛺�.���>Rd_�~C+?��jO����6�Z)|U��^'�b�j�ڌ��=By�ןԊV�;R�O������������ޡ���P�x[R��87�y:_amJ.I�7Lv���jK�h8�N�v����s]��gCZ�'�l�����$��1j�}�ܜA��d���~|w���^x��Jo]T{��$���{+e�22���Jo��9$x�������'�z2�$��%�55�K#����ߚ�:ß��=����  �Ɣ�9j�<E�u�:ľJtn�����^ْ�
˜��#�|��� �O"�e@6���X��@�
��@�5���n�ι��q!�c�t���M�iܹl5V�7M��6�Z�bE�0��T]Z(��@�z�k���#��A���L��o_�Y�s�*�:x|�\�ag�"�B��g�ж���Ƈ�&`�C}�m�}o�!+�=�U��cЬ����k�}r�x��a���O?:~2zJ9����qU��>]��Fx=�b�oz�%�b��K#��=b���9h�ȃp�m�q� �>�ΰ.H��_W�>0�X��bCT"p���;:�<:T�v�Ae`�{��	 ~y �BB!�^�~�=�������;�XǏ�캶�Z�nRE��������̈�'��>�w2���>?ꋯ^yJ����mb�ˇjA/�l��8T�a&�2�<0���$1�X��a��8?��c���0:J���HH�y��s��Q>��ã{�(��1}��1}��1}�_���WL_��ud�;��1}������h������t��"D������R�A$���f��;���G���v��N��(_�"�;=���E��\�-�Z#I�^s�m��|m�f�A]5J|3��2o2Q�BO��K��A�ۆ�-�h*��J젃�YǊ�6�����γ��m>���l�)����lt�"E���U�|�j�uA��U�QAE��>o�ӥW��ƕ��S�(۬\�3h�H���������%�l��)^�l�:;HRqZ�� ��v��Uah�r����71�/_pW���k��T@j,���d��ڢnK6���Mn����ed�-����2�����u뵽h_n�s�m��A��y��O���	���0ō��� b��?��/PI[��F�vaT�xl��ې�AQz\�XF(k��rDח�$��`�2f�;�<��w�Å����K� �p/3j��u�ɪ����1Fr�g�^ҙ��P�NB$�����*=.�.i���@�������Đ��؁�Y/\հ��(&���C����3���Z/7x*�3��w>՜�h!7a��v�8��>����*}k�b�ڝ�b�Z$�ط�!��ž�ط��v�b�L�Z���s;��� ��]s�b-Bd�c��T��=��²���1���!�����B��� �D����څ��T�Y�X��H#�J�P!�L@v,we��Q�~�;�vo1W;�Nd��`�An�kx}iN�?(�c�uc�߅�Xk�ź����a��M���IL*qa#!i���{�4�>�Z�5�*���/�V�C^	i%��7(_a��m�۶�mߠ12V�#g(�6���t�I$�H��"�A�:&w>��_�`�I>y�j�F�	��tNfVBc�X��Vd�]����N�4�hR�k[ ����3�L�A����o�ܲ�
A�8j7n��O_����?Q/o�Boj`z��t���WEH$���t3����ci_���8���?�fW�����#	Q��8�?�z-5>������g����M�B T�t|��(�.\����b�D�1����&�d�(m|�rfJ?1�����o����"��9�0wN<{2�\$n�f��1�Y���ݠ��ht�;�J��6��-���f8V@��o�e�p���|������^�&r�qJb?kM7M�?�;��A��O���dR
S�~���ް@�4�W;�P�d�.f��j��)VB�/�!�J����ɭ�]|OLd���3UZ_�̓���� ����Ad�A~tSOa����E��ŏ85}e1�V`p�H��g�ٮhl��q����2H�"%���	����^�j_0e1��Mګ�̹K����pN��~�����?�߀;V�i[�`?�\Y�(1�%̿�`��i' ��I�LSXu��kv�K06�1����6uWƁ� Yصc�*�A�y�찙�uJçO��=����h����ע���IC)�!�U��1Rs����[��e��p�u[��#�p2����m�Y��
��
��+K|#�.�$��|�wl�~
�'��fY�{��R�_� ��c��a%X��3�?H�����J������N!��Q�oY������%:�;��.>rX�ִ�D��,>�Kr����̭Ʃ(=ډ��|H�Թ*Z��طF�AI?ln��,"d�u<?F)�������mzel챷F�X�`8�SW�x��9 ؂wi�e��V�,V��у���Stn���"��so���kџҘK)�b�s����eV��/����d�z��F�3ʝm˝��/5��P�]5\��b���RR������%"��\�.�_P��c�:����ry��',��ޥ����Ⱥ./��6�����cȵ(�E��ZP�߾���D�3��Pz�D��}�\i
t$�c�b�1 �]�*m��,3�<�E��"�>��;l1�Lԥ�����k���c{ *�K�8�t��.�r���j��󓀏0�V0N��;<&����[��'w��_�%_ t��r�����C& ��P'j3��9L�C
���'�[�C�|���{�>s��je���W���1�yO�"�e�[�H�"r{���q��;��/jw��.P�M��p����3>"��g���kZ|5 Z���B�d�c%ߦ���~�A�p5�3k�TX�'�s�q$�@ˠ�|�!-��maj��P��?���G����A�ۜ�Rw��s ���KC���+���r��
b,Z"���,���
�5Ә�����=k�2�Y��)q���*ܵ��z�֨9�6s��L��b���E��vR���ť�+�zef�B�V6�K.��"�j$�-c����    �p�^_�-�R���VJiK� 5>B�޶ʸ7�~��D��p	�)�����z�a�OM�7~���-��������[e�J��b��r�<,��T����TgL�jN�t��m?j�f\�z@^fc�
����b��*�t������Rf�'�U=���N#qi�����L�5��:��tC6�]WH�ug������]�V��O�c�l��6��ٿ$�ˤgG�����V�͚�a��ң%�]���ưή0Z��C9�%�kD��I�{���n)L9f��6&eQÐbU��5�/�ɒ�[�}���z�S�k�w	��BLxL�c�ۆ%��]������r�ut�Y�%��U�P�$IPb=�  8� 1<:����607�&<�	�Ʌ�}�"z}��� ��p�53��_�?�ү��җ�U���}����	/4k��C9.Kb�+G�R������x��> {��{�f��2B�Z�09DA��.Ε�޼,����mC<�^-D�� �E��F��o�a�dn%��o?	$$\vŵu$_r�n��b��mQMy��1�8�� ��!�r�;��u!���)�B�R��k����C.�Q�@�v� s�H�D�#2�1��n2�����Q)�!!ɣ|��Q�%\�� n�+�#c/T���Ƒ_�XC~g��zs6E�%ZȏB���30lT��f��W�",̀[�i��}���.#[��.����g��D��?�gr���u��Ĭ�h岒�T��~ҧk����%^��/q?�c����R0�C���cC�q`d;m0�����$���!����4@��0e)5��4$J�(%�ؐ��1���L�\K�/oO�^�$��8�t�M���ߔ��A�E��׃I7��{�T���_]y��ك�aT�Q�o�6aV=a"85W�3@���1xl�6�ϔm>A�s	=j�6��)�<،'��hF�V����<)��hd0��⍨�k[�yG� ����B�#�|8Q�����|!]ς��YJGƻٓi�k��	\� �6�i~\ �)pTv��݌��l����Q�? ��T�0�K�H��0�I�BQ�:��a��V6�\̴݆/WBRGU�6�护����bO�S�����N�q&� �� �S�j�E��^B�<ݳ@�~f�����D�/G�dB�����D�nh�w eÂKI���tPf�5D�晛J����=7&Y�~�=�e��*:¹Dˆ��ma�ޒ
B�n֍�w�.�D�"��Q�IE ���`3Q�D�r�l|4Q�m�΅� 53:�4���Z�F��D�I�?��ǽ[<K������5���
�z������[���j��W�E�P��ܼJ�1�Xށ�*��yZ��dQ��2wk�?l@�+I�XV�	���O��%�P����I� Q6n��$0VqȼM�U�WQyD�F%���l��_���{�QsDͱ=�!������9'6�F![}t���E�*Y�*�=:�\]�y(��&u� �Iӯ� 53'���: ��SHz�
 *kj0��p��`m�Ʒ��Q�OՁ��FfxRz<�^�y���G�N�:7�9=q��]z�I�6Yt�Q ��ljz��9�[Mk G[9z�1�/I�L7�����=gm�H)B�OQ?ݺ88��D�Sר3bӹ�-j����F��EN���Q0���ީ&�f��r-6�2@@0/��*>��Z�"]+�Y�S/���l�L�Eq�lA�n�Nx����.��W��2��ey��]�f{h��h׉�3H�:�W��F�ʆǎ��讽қ���BÚ�7ipA�-�iZ�������J�W9�������S_96b�OD؈z7�݈�I�G�����T����Ta#2Ed���6"���E��;���lf�8�s��t����}�����*�ӽE�>x���M겭�$�'�d��on�����ۯ����<<~�����IY�i����#�O�#��>�h�(���&�
Ί�	)�����"F*c��͂����ot�,g�E��lG\z�/|��/��!G��70�������2VU��{#�V�|Z��0��H�ĵY�Pו0�w����Av�>?C�l����f;��+�$MHr�Jۻxυ�<�ԋ[s�����`��-L2n��"�uf<��r���L��㤕/�8�sma3?D^�N���h���7�5���b��^�*��O&�>��׊���GGG��G�����Y4Ͷ��]� �=eE���݇���)��]��jV��@�ѵ�5K�+Pw<���U�"�B ��_<=�K>�0$>A��D��]�v��^��bC2�q���wm�mA���
>�hH�-�N,)�&5�:q;�Kce�$6�p����w��,I]4�9���x�wv��匿�nv�[N#�5/�rZQ\�������M��Ez��̭/�ԯ���589��m3`� �E��T��ʔt%r�l� r��%§m�I	ͧ����c�7&�B+0֘&j���3�*�_7I�*C?}�]��[��
o��,��.�=H��D/y�?W�q���r�:�cMm�#i<z���V�bm^�΁�yI+����ܶ�{oi�-6a��VΆ(��7�9�vId���_������U�S���I�>�����9�u���	��Cؙ�	�'p��}��Gا���c�V��ӝc�>t�h}9]��sE|��;���f��1�k�AF]á|a�yGMQ��حޔl��y4�C�M����F�;6ػjb{�����Y���.r��u;G�h��ʁ��WS��7��X����}��

,�yp����:���VX��Y�޻�A��p ���KѻoJ��,�B��Z�$�
)��//��1��'4�L~���(_r��Bxm��D�7�ڇ�Ưl�4��!�����E(x�Vtʔ-y!�~�9�ͧ8����zБ9~}��ݠ'���{�7�.~�Y�6U I�O�x�� Uے��%)��w}ŉ9l٣�F.�g,�1�۵�BH���sч�f��3�̩�e���t��8�
ce��\[��!{�a��]������)D�#SA��!
���U*�^ �}y#@�_PPA��/[��R���������q�"/��^�:%h����v�%I����ɱYQu���^��V轠b�l1��"X�ּ/�9�4�8�$$�����ì���t�׮E0��۩]�Ju�EN���v�+y��4g���w��r�#_��l�6l��D	-���)�,�ib�A�Mv>�#&%�0�8P+NC�;x�x�)���rBF%H`�N�I&|�pٸ��^���z*���8�a�{�	�1lwcxyg7����������U���sYpE��J�NH��j�r�*�dU*m��U̡���K�<�-:a^�/1�H� ����S�Q�<j<��B���n�En�i���~(I�;х6?c@8���erX���|����[�'W���ƴ_�m����֓�>��������������ڡL�q�֡��)���( ����>�&No��ge��Y�|U���-����`ۋ�������_��i���ܦp���Z�z�J9��S)M �
�Z
�n|��^6.4��jJ{ǭI�St⣍/GX$=苨�NC\��In�e�'08#9��b�����|48k�|���>9��F�Ko���T^�i�M�s/�t�[�G�$�$VI�4�ޯĂ9: �ɴ�rTH��å�K����<,�{�`f>�(��5�D��� kj�{�ԙ2���v]����ce�C��TS"��1.ڏ�Xm�擹1��v�\V����>�Ax��mo4�m��3a�����~��L�Ʋ���)�NV���&"f��:�&��&��놐9ᰑ��J�h���6��y�zg�97l���&�$�hH:��{��g�Λ�[�9��Ż�Y�OO$�`�W�s[s4�sC��Eв�9�:��|4q�v��#���"<������bQ!m��a���v��|q�O�4�:a���D큉�r� �  ���e�7�r�3��X�����D��2_��.����ُ�E
o��L����3�M(9Ep�<L�����d0��2��<�i�:8�WSu���N�!(Gq֒�H�0c$���8�f;=Ĩt��@3#%��V\����c(���{�!�Y�`-��Ñ�gB�	�K�&>�[iҶ5ic�UoX�2C޷��m�G�a�����[�����\���}r�j�	G�%Ֆq��06gmi��ih���T��;b4�lf���F�]:a�
���kFl�����:K�����-����r�;��ƣu�,0��P0�,�fB��t�0~f�B�ҹ��AcH��ꅑV4+\���CM�:�c衆j��~��O�)?E���������"�G�?E���X������_s�{>      �      x������ � �      �   M   x��̱� C��<\��"���K�����i��y{���چ�����o�z�����V"�3��t��� (B{      �   �   x����
�0���S�&���M�<F��lt���ۢS�����%|D�o?u����K�[���c~�R%�%�9�F�J�q
�E&��F����d���#7B3â���b�� ޖe?�q �m���Q���3�7F��?��4� w�i��HUM�����^�R,_1�^zP#      �   �   x���kj1�˧�4zر���稼I���A`��A#�9g�� �=�����
$,ڀƨ�a:I��=;��+,�C�U'���!?��H�����:#�5*$D��%䟷8�/��p]y���Nd'�MZ����J�Ϥ]�;ɯ�l��+�����6�$2��BGH��JiS��yŵ;�\y�<��"Ӽ�y��G:��#;�}�|�J)��=��      �   �  x����j�@��g�b_ ef9̝h�
m,�BAD�Vh�x@|�N�mj�	f��fv��3�������b[4&�$�Xc�J�Dm@ i��B&�O�y��ğse��v�N��p0y�uq��l7���`�^�c�l"�4��ب`4!Kq_g+S����pЛt��A��~�Y��f�,���.�Dc6ɵ2!c]@9p�����d���,��ö��Y  �Ʋ��ɫ���<x�C��dJ��ZZ񒞀u�|�"�$�{��oӑ,X���/�N��i�Cv�/#R!�?�/�5����p�d��C,��	����Nn#v�o�J ���1�A���C��	���b7۔�r��z;��Y�b���`H\���b����X�"1:�ٍXôɓ�Ŷ�Ӻ6y�b�&O��{�QJ}au�      �      x������ � �      �   �  x�}�ˑ�0D�8
`K?c���X��b�`4~-�iK�7����A� ���E�t�sS�z�;H�;��mU*�m*}��۵{=�v֥�����=a��-jˆ\����2�g��L๞@ �(saЌFg4��I�NԌ�6f��˴0r�"'� rj������.�%l3��`���l�����h8^���7�S?�'h�#��2>�UN��	���.)������w�^�xA\��n���bX(�^���ZF.�H��#�b��2��Y�.�+2��] ��C|�
�|2.n���xϔ.A�����c�g�]��/'3X<`���`9��dx7�{}Lɼe��%s2������%���Y�-]��~�ě��G��)���-      �      x�3�4�4�?����� )��      �   �  x��W˒ۺ]c��d3R|����J*�n�]�n�I��D@RV�>�A=��:YdJ3C �~t�im�gub�(%��0�� �VA�
#.D�i�]Gb��A V�Ã �������$�i��8�[��ϋ �Kņ���B8���>���n%�]8x'��b�&Q���I���&�.�i ։�l�]v�L6I�8��q����Ğɢ�+\Y|�ʺ:T���z<4��3��d�,�]5�WÁV ҈`��0#�06f�K�������T7�Oҫ���������
n&,��C�xn���Z���力��T�ʤS�/�\mN��$�6��c�;�[UhI����q7�5��48=(�g���q�?���%�x��b�"��a��HXo�A���,�tNW��=M�v!��H) �������X�Ow�uy����V��mE77�*�IQ]����[�p�(�7G|@����r��|ʿO^�ts~���`px��1��AQ�~�@�2��N�X�@���xO:�-�9ϐ� � q/�@4�]����{��Va©�4n��_ǬѮ�q���ŏ=�_�؇��,K��O�߬n'HC�#zΖ}�.{�q�ܚF��>�Or'�G�1d�:���o_O��HQ�N��W�/��c3����ܫ5�;ʂ
�������`��͉,�Wo���n&�4Aؒ�a7��>��:?��Sҝ�gS(��/~�CW���\}4m�,jݙf��jR��9���r�U\����sA���&o�<	y�6�{d/0@?�ٗ~����I����d{��k���d�ڢ�4X����7�)+����E��u������K;��Ũ9�Lun�h��U�IR��譖��B;��WmU%mA	Jf3�-�0�I�ʤs4M��jj�r�R�����ԍ����:�|���@1_:�n|�튐�(!�##�����S�Q7����ew����V��u�x/m��1ZըIB�"�:�J���ҭ�G��7���:Bh��5�W*�������U�
�i��g��뎗��)�<�dm2@����=#=#���;!Q�77l��R����)�Ѝ�뫽�,|m��f,��̏�~����Z�+H��ʪ+��������+� ��_w�"�C��Q������Y����wOo�Q��J(�+4r��p�䥙d�(��(½��-藠 ���e��łk**nz����������,
@�������O.��Q=�y�x�Tc��ޘ�������@����f���$!�9�d�fV�V9�u$hy�W}TsB�o�`3ɹ �1���S�:�6�භ�z���nF�-4�x �%�B�!s�kL.Ք���ɢ쌮�j�O�����y�uA"�/�V����t(�l:P��2����0b~��C��Xgh���T�5��pl�U5��pqiA�*}:�J��-��5��#���y�0�rRƜߖ�m�P,."*��x6�[DA����>�U<yZ�J�ថ^���U";�1\���v�1C҄��Oμ�CЉ�uQ����uh���:�I��ғZ(@L6�FUjVЙ�cNÍ���9E�0�y�j����E?{*D�v��\|������}9�`�4������\�
Hڼ��k �.En8C����~�l3UQ��4���Y�^XBD>��K�?���<�Aked�֋yG��w����:��p�w��_^^���y      �   �   x�m���0���Y =�`'�	��U���s�x��a!){-�j+����-��zѬ��q8�"}?_{�Np�eO�f�
��sdv������P����x(��6�ݐ�1�[H&۔V�ot"��p"�@�.�1����::�mH{zE_�.��G�����t�绎� nS�      �   �  x��VQo�6~v~1�kZD�$K��>mЭ֡X�+
�t��ȤFRvݧ������}Gَ�+ڗC� !����x�(�ϥ�D��_����+�^\Zҵ/�Ȓ,/����d�;�S�j�s5�=r����;{8�#���������~W�F,�s�̊��X���B
M9����P1��`�y+=5��^K�eC�x��RȮ��Za�݊irO�E�#�(J�(��dR&I9.F��j��yRX2��s�.�e��'æw>�6��Y���z^�'�z���ݜ�=��&�|��\�&�WF�'/�r�woF�i�bcl[�0Z«��%{U�^�[^�T-�i0cF�"f��5�R���+�!�VH�Q��p� /���+rgׇq:��%Ѫ5�	�4��q���fe�#�լ,&e�`5���ycA�#����f�5�ősR潴^U-����Q��#��E��ёCvRi9W-
&�m"5�H����-��fE�<̊�^v��ӹD:ɴgq>��b7�ts2��Q �+�!�h�Шf햪s�`
�/��_ �i�g;Z z�{�>�:��"��V�|qA������pat��?ze��Fu�-5$*�c��)ֲ��T9O]��pM����� ������3r���i&.�F��.�YE�R�BE�D�d`�FJ���d��R���u�ڑ�M-��n�'����pZy�L�_�|Vf�8-��Ũ`uL�3瀨B��L�F�{��.�X�t�h�-��#7�'T���8�׶(�A"�D:�{R�(�E�s��]�%����87��ɍ�#B<l:p���e5ձxN(��E�����QT��u���F�<J��?����9$�No�E�}Ci�It�,��,:d���gq^L|�|>mMu���tv�yS�OV�u܊����� ��I׵L�Y7��Q��C���836,�Z5��$��ejk<wZܪO�C� �~c�bW;���0�3�c	�Z�� �!ۻ*�N��a�����rE7�H�H�h�6�~�?D_l�$�g��y�є_\�'���w*�zW����3��a�c�����כ�7r��k>64��������!.�3�5���mC��r�u����6���Ѯe�9����,Rs�(���f�+4��gL~,Icb1����C�zgʉŏ�	����_[� Z&��LlxpT��0���0�(;�l84D�y�6���0ۚ6��n��Մ��ch��s�s��1N���
E�ne1s�a��y���h��x�F�r<ݯ����:����0I��NF(<��ء��,sLK�+s<t�m|��/�j�k�BYV��t�)�5��0���ja!⑧���Y�v7h~V�+t6:��.؜�������������]�_[��%_M'���P��ⓓ� �/<N      �      x������ � �      �   �   x���=n�0�g��"��'��!:u*��m H� iz����@сH>~��KJ��3���- ���|ٗC<ާ}$�!'�F�j�#k@
�^(��q����jWq��5M�	�
8T���*��m<Noq:�x����]��#��+/��Dy5�K�L?h�-%�g�Ј=f6���1h��R��7���z�$VՏ�xT#�e�=�]��ܻUa      �     x��YG{�J]��o+���X���1�{��T"��[lp��MCӢ�B뜛�-��o����z������\\Y ���<�J%��:\���!&��Jk�]m�L�u�
g��fz4����IG������0��U~B��~\N��~M=������鲟�6��i�)�kY��ró���/|�8��x��]�#�|�*f�7�����ڬ�3�r"�E����)����:��$Eq
���p�8��d��BR�f�@��52��%c�J����<2+�9
�GG_�o�]��.<��2,N���Hg��E�m���
Ѡ4/<��zSޟ�ǒ�š\Ӷ��5G���r���	R��Ӎ�9Rw�O���'�8PE�? ���f�T�P���)rY����\��|������ە�9u����p�A��j�f��e��̯vxX��Wb�m�� 0N��ǎW9���.79��]�EƁ���S�Q��0�Ur�Q��)lWN �K�섂RFH��H����+� �H�a@���������h>pVzv�|xW����Mk��d4�b�'�]����ҩ�����Ӝ��X>t�"����'3��p��!�>����_��a ����hP)*=E%Jh��}�d�MU�t �q ��.�i�CW#�K�G4D
[���𨝙�/��r��$�|�}q����&�Dp�n�7 �a��@ا"�<y����[�J��.C���ɘW� r��:V���;�w6f��tN��ٍ"�E/ysu�g��O���k�X[#6�cnpq&LzP�D��y�3�y�n�������aTs��q��{*%��H�~��'�%�K�u�S�䴊l�aX)�,C�=�a��$�')�N�x�(VP�p�(�]m"�jb��K�0���ά���<]�+f�K�`{a�V���E|x}^=��mQ?�����t�}~�'�UuJ��������(�	��P�֗�F�ۖ)��>���U@r٠W����s�C���g.�J�PעP!�7>|E��O���"y�"�}���:�᮹)��U�1�1F�7<�����Iev5/=5�ehw���\���~E��-������)$$<-DhmH^B�}��J��^��~��MBN�@��P�q���n�!$h���2�Pd�$i�~ʗӲk���(drA��Fm�k�t[�ɶ�<yz�Z��1�w�fm�����D��������|d��@�o{cp�M��)�g,�qҝM���m�^v����?P�BiL�؍b�'+�J? nh|��i���=����٬=�h���s妓��A�c��깸՟>)��=��|3�C���>M��u+����*3�mE�Z�.Cԗ�,㫼Ő���(�7���������m���C����1���eZ��4"_)�B����7G������T�v4�ob�̎ʽI��>m=m�x����f,3���k�=/�Z�����;�H�T�c"���c~� J�IO\)�[PaH$�Kr�(�M�O�8r$B7���P����
z5ꕞ;��ry��n�K��Ө��������r�������G�香ݴx�-w�ΑVw5
R��7���	]j+���0�	�e��J�� ���k|��zk\)C�>f��!��9tmei�TY��g�q-���q�?g�Nmr�u����c�o�ê���r����t������}���)fOHa6����PCi"!�s'|��B�S�k���(d?���nE�UtSh���m,���&g�|q��|�9#|c���uEۏO���"?���~�[tŔ�����8ܧ�m^�wt�{�oo��L�+�M7�~Q��SX:0�}YfVr�ՙ*ŠM�F`MR!01�00a����B��u�!����H��1Z�7����G��Y5���9}�]�d֍sS��/	a��� ������s5��@:iJH`�0�N�B��p}� ��cW��
h� ����onu��">�\e�T��TZ�A��<�"���a����i���E��9����������.�}��_!���gHҁ�� ,��qB�"�G��J� _��<a�k.����޸:zZø��G�ͪ�\H���4�f����}���X���q�Yy#e"TE�2�^>���0�2�Vd�~U|�KgLbzڅaI*�{�-$�ǁ`�8X]Iݫ!��W|�-����f^*f�y��B\�E������ۇ�󖝑M�un��>L�N53��J|�w��l����L:��W}�v�*y�U�B%'����GA��~��F�9p �����Br�sR����� _Т�Wf���q�9{O����:��<ݎ�w�T^���D������`�g'sIe��7'�\��"Wg'b@[����n`��]e��e'c�Ŗ1��8��n��0�H�ꀄ��I�$1�!΃�o���ϗ��y���y8@��:s��n�^��yq�-�[�d��M��h���r�	����x�#��3���\��Ӎ�����I�B����i9��zB�t*��0�2MEмQ�8��37d0P�G��i���G��V��/�\,�5����z���lV�v���C偗ϖ1��P<T&���W�Az�9�K�2�4�_�>O�$9������Zz�(��b��?��<$pLts@Ձvjׄ"�6!�����/����9��
�y����r�����k�M�/l�^��ϭ��n��%1��s^����lJ���
��K�	W��g��_�o�YB���v���H�K(;� ��ɨ�@�ŒG�`7
�K2BL@��/"4bk	�0;����d���(�}=5�8nw�0�M���f��e�w(�QfQ�99[ZR�����n6y��9v^�?��F���)���a�L&򆕋2B6��!0�Q�V�~G�I�
;Ձ�m&������\�O�#�|M���ɩ_7��3�{fj>Tź�a��ΨHu���l���s�[?x����[-WU�kx:�)j�r���M��B �k�g6��	��O��N�P9��4�|���W?u�� �(��}_�t�]m0�4�x�ԟ2��s���>c��'_I?��L�����8g�ҁ�]�����C�~��Z�Y����ؼF�Y���|Wm�d����X�/�aO��o�����$���W$�2��+@�g��
6����f.��p�Km����t(urz;���ʩ�(::��n�[	�|-D���<��%��ӥ��<[���_�m�S\E��5�`��O��}���?���
2$��b>���<��d�������1C]�QfPG|��Fk�#��Ü/�x�E�� ��/��_^Nv�Ӎ��V�́��U|/3�e������/���}��^���%��ܳY�@��m�*�>�#�&\���>\��Vd�:�qˎrt�̧�U!��|"e
H�G�0N�xnjf�����ӵd�q0g�3#�9���Bf0���yU_Y�L�Ņl�*q�<���qՕ�����ݚ�	<|x|b��Rron������n�9^��l�V��������_�s�      �      x������ � �     