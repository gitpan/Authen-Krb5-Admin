/*
 * $Id: admin.h,v 1.3 2002/05/21 18:36:39 ajk Exp $
 *
 * Header file for Perl interface to libkadm5clnt
 *
 * The file admin.h from the MIT Kerberos 5 distribution does not get
 * installed by default and it depends on other header files that
 * don't get installed.  This file contains only what we need from
 * k5-int.h and admin.h.
 */

#if !defined(USE_KADM5_API_VERSION)
#define USE_KADM5_API_VERSION 2
#endif

/* only what we need from k5-int.h */

/*
 * Note --- these structures cannot be modified without changing the
 * database version number in libkdb.a, but should be expandable by
 * adding new tl_data types.
 */
typedef struct _krb5_tl_data {
    struct _krb5_tl_data* tl_data_next;		/* NOT saved */
    krb5_int16 		  tl_data_type;		
    krb5_int16		  tl_data_length;	
    krb5_octet 	        * tl_data_contents;	
} krb5_tl_data;

/* 
 * If this ever changes up the version number and make the arrays be as
 * big as necessary.
 *
 * Currently the first type is the enctype and the second is the salt type.
 */
typedef struct _krb5_key_data {
    krb5_int16 		  key_data_ver;		/* Version */
    krb5_int16		  key_data_kvno;	/* Key Version */
    krb5_int16		  key_data_type[2];	/* Array of types */
    krb5_int16		  key_data_length[2];	/* Array of lengths */
    krb5_octet 	        * key_data_contents[2];	/* Array of pointers */
} krb5_key_data;

/* only what we need from admin.h */

#define KADM5_ADMIN_SERVICE	"kadmin/admin"
#define KADM5_CHANGEPW_SERVICE	"kadmin/changepw"
#define KADM5_HIST_PRINCIPAL	"kadmin/history"

typedef	char	*kadm5_policy_t;
typedef long	 kadm5_ret_t;

/*
 * Succsessfull return code
 */
#define KADM5_OK	0

/*
 * Field masks
 */

/* kadm5_principal_ent_t */
#define KADM5_PRINCIPAL		0x000001
#define KADM5_PRINC_EXPIRE_TIME	0x000002
#define KADM5_PW_EXPIRATION	0x000004
#define KADM5_LAST_PWD_CHANGE	0x000008
#define KADM5_ATTRIBUTES	0x000010
#define KADM5_MAX_LIFE		0x000020
#define KADM5_MOD_TIME		0x000040
#define KADM5_MOD_NAME		0x000080
#define KADM5_KVNO		0x000100
#define KADM5_MKVNO		0x000200
#define KADM5_AUX_ATTRIBUTES	0x000400
#define KADM5_POLICY		0x000800
#define KADM5_POLICY_CLR	0x001000
/* version 2 masks */
#define KADM5_MAX_RLIFE		0x002000
#define KADM5_LAST_SUCCESS	0x004000
#define KADM5_LAST_FAILED	0x008000
#define KADM5_FAIL_AUTH_COUNT	0x010000
#define KADM5_KEY_DATA		0x020000
#define KADM5_TL_DATA		0x040000
/* all but KEY_DATA and TL_DATA */
#define KADM5_PRINCIPAL_NORMAL_MASK 0x01ffff

/* kadm5_policy_ent_t */
#define KADM5_PW_MAX_LIFE	0x004000
#define KADM5_PW_MIN_LIFE	0x008000
#define KADM5_PW_MIN_LENGTH	0x010000
#define KADM5_PW_MIN_CLASSES	0x020000
#define KADM5_PW_HISTORY_NUM	0x040000
#define KADM5_REF_COUNT		0x080000

/* kadm5_config_params */
#define KADM5_CONFIG_REALM		0x000001
#define KADM5_CONFIG_DBNAME		0x000002
#define KADM5_CONFIG_MKEY_NAME		0x000004
#define KADM5_CONFIG_MAX_LIFE		0x000008
#define KADM5_CONFIG_MAX_RLIFE		0x000010
#define KADM5_CONFIG_EXPIRATION		0x000020
#define KADM5_CONFIG_FLAGS		0x000040
#define KADM5_CONFIG_ADMIN_KEYTAB	0x000080
#define KADM5_CONFIG_STASH_FILE		0x000100
#define KADM5_CONFIG_ENCTYPE		0x000200
#define KADM5_CONFIG_ADBNAME		0x000400
#define KADM5_CONFIG_ADB_LOCKFILE	0x000800
#define KADM5_CONFIG_PROFILE		0x001000
#define KADM5_CONFIG_ACL_FILE		0x002000
#define KADM5_CONFIG_KADMIND_PORT	0x004000
#define KADM5_CONFIG_ENCTYPES		0x008000
#define KADM5_CONFIG_ADMIN_SERVER	0x010000
#define KADM5_CONFIG_DICT_FILE		0x020000
#define KADM5_CONFIG_MKEY_FROM_KBD	0x040000
#define KADM5_CONFIG_KPASSWD_PORT	0x080000

/*
 * permission bits
 */
#define KADM5_PRIV_GET		0x01
#define KADM5_PRIV_ADD		0x02
#define KADM5_PRIV_MODIFY	0x04
#define KADM5_PRIV_DELETE	0x08

/*
 * API versioning constants
 */
     
#define KADM5_MASK_BITS		0xffffff00

#define KADM5_STRUCT_VERSION_MASK	0x12345600
#define KADM5_STRUCT_VERSION_1	(KADM5_STRUCT_VERSION_MASK|0x01)
#define KADM5_STRUCT_VERSION	KADM5_STRUCT_VERSION_1

#define KADM5_API_VERSION_MASK	0x12345700
#define KADM5_API_VERSION_1	(KADM5_API_VERSION_MASK|0x01)
#define KADM5_API_VERSION_2	(KADM5_API_VERSION_MASK|0x02)

typedef struct _kadm5_principal_ent_t_v2 {
	krb5_principal	principal;
	krb5_timestamp	princ_expire_time;
	krb5_timestamp	last_pwd_change;
	krb5_timestamp	pw_expiration;
	krb5_deltat	max_life;
	krb5_principal	mod_name;
	krb5_timestamp	mod_date;
	krb5_flags	attributes;
	krb5_kvno	kvno;
	krb5_kvno	mkvno;
	char		*policy;
	long		aux_attributes;

	/* version 2 fields */
	krb5_deltat max_renewable_life;
        krb5_timestamp last_success;
        krb5_timestamp last_failed;
        krb5_kvno fail_auth_count;
	krb5_int16 n_key_data;
	krb5_int16 n_tl_data;
        krb5_tl_data *tl_data;
	krb5_key_data *key_data;
} kadm5_principal_ent_rec_v2, *kadm5_principal_ent_t_v2;

typedef struct _kadm5_principal_ent_t_v1 {
	krb5_principal	principal;
	krb5_timestamp	princ_expire_time;
	krb5_timestamp	last_pwd_change;
	krb5_timestamp	pw_expiration;
	krb5_deltat	max_life;
	krb5_principal	mod_name;
	krb5_timestamp	mod_date;
	krb5_flags	attributes;
	krb5_kvno	kvno;
	krb5_kvno	mkvno;
	char		*policy;
	long		aux_attributes;
} kadm5_principal_ent_rec_v1, *kadm5_principal_ent_t_v1;

#if USE_KADM5_API_VERSION == 1
typedef struct _kadm5_principal_ent_t_v1
     kadm5_principal_ent_rec, *kadm5_principal_ent_t;
#else
typedef struct _kadm5_principal_ent_t_v2
     kadm5_principal_ent_rec, *kadm5_principal_ent_t;
#endif

typedef struct _kadm5_policy_ent_t {
	char		*policy;
	long		pw_min_life;
	long		pw_max_life;
	long		pw_min_length;
	long		pw_min_classes;
	long		pw_history_num;
	long		policy_refcnt;
} kadm5_policy_ent_rec, *kadm5_policy_ent_t;

typedef struct __krb5_key_salt_tuple {
	krb5_enctype	ks_enctype;
	krb5_int32	ks_salttype;
} krb5_key_salt_tuple;

/*
 * Data structure returned by kadm5_get_config_params()
 */
typedef struct _kadm5_config_params {
	long			 mask;
	char			*realm;
	char			*profile;
	int			 kadmind_port;
	int			 kpasswd_port;
	
	char			*admin_server;
	
	char			*dbname;
	char			*admin_dbname;
	char			*admin_lockfile;
	char			*admin_keytab;
	char			*acl_file;
	char			*dict_file;
	
	int			 mkey_from_kbd;
	char			*stash_file;
	char			*mkey_name;
	krb5_enctype		 enctype;
	krb5_deltat		 max_life;
	krb5_deltat		 max_rlife;
	krb5_timestamp		 expiration;
	krb5_flags		 flags;
	krb5_key_salt_tuple	*keysalts;
	krb5_int32		 num_keysalts;
} kadm5_config_params;

/* Database attributes */
#define	KRB5_KDB_DISALLOW_POSTDATED	0x00000001
#define	KRB5_KDB_DISALLOW_FORWARDABLE	0x00000002
#define	KRB5_KDB_DISALLOW_TGT_BASED	0x00000004
#define	KRB5_KDB_DISALLOW_RENEWABLE	0x00000008
#define	KRB5_KDB_DISALLOW_PROXIABLE	0x00000010
#define	KRB5_KDB_DISALLOW_DUP_SKEY	0x00000020
#define	KRB5_KDB_DISALLOW_ALL_TIX	0x00000040
#define	KRB5_KDB_REQUIRES_PRE_AUTH	0x00000080
#define KRB5_KDB_REQUIRES_HW_AUTH	0x00000100
#define	KRB5_KDB_REQUIRES_PWCHANGE	0x00000200
#define KRB5_KDB_DISALLOW_SVR		0x00001000
#define KRB5_KDB_PWCHANGE_SERVICE	0x00002000
#define KRB5_KDB_SUPPORT_DESMD5         0x00004000
#define	KRB5_KDB_NEW_PRINC		0x00008000
