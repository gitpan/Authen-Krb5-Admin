/*
 * $Id: Admin.xs,v 1.10 2002/09/18 12:56:59 ajk Exp $
 */

#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include <krb5.h>
#include <com_err.h>
#include "admin.h"
#include "ppport.h"

static int
not_here(char *s)
{
	croak("%s not implemented on this architecture", s);
	return -1;
}

static double
constant(char *name, int arg)
{
	errno = 0;
	switch (*name) {
	case 'K':
		if (strEQ(name, "KADM5_API_VERSION_2"))
	if (strEQ(name, "KADM5_API_VERSION_1"))
#ifdef KADM5_API_VERSION_1
	    return KADM5_API_VERSION_1;
#else
	    goto not_there;
#endif
	if (strEQ(name, "KADM5_API_VERSION_2"))
#ifdef KADM5_API_VERSION_2
	    return KADM5_API_VERSION_2;
#else
	    goto not_there;
#endif
	if (strEQ(name, "KADM5_API_VERSION_MASK"))
#ifdef KADM5_API_VERSION_MASK
	    return KADM5_API_VERSION_MASK;
#else
	    goto not_there;
#endif
	if (strEQ(name, "KADM5_ATTRIBUTES"))
#ifdef KADM5_ATTRIBUTES
	    return KADM5_ATTRIBUTES;
#else
	    goto not_there;
#endif
	if (strEQ(name, "KADM5_AUX_ATTRIBUTES"))
#ifdef KADM5_AUX_ATTRIBUTES
	    return KADM5_AUX_ATTRIBUTES;
#else
	    goto not_there;
#endif
	if (strEQ(name, "KADM5_CONFIG_ACL_FILE"))
#ifdef KADM5_CONFIG_ACL_FILE
	    return KADM5_CONFIG_ACL_FILE;
#else
	    goto not_there;
#endif
	if (strEQ(name, "KADM5_CONFIG_ADBNAME"))
#ifdef KADM5_CONFIG_ADBNAME
	    return KADM5_CONFIG_ADBNAME;
#else
	    goto not_there;
#endif
	if (strEQ(name, "KADM5_CONFIG_ADB_LOCKFILE"))
#ifdef KADM5_CONFIG_ADB_LOCKFILE
	    return KADM5_CONFIG_ADB_LOCKFILE;
#else
	    goto not_there;
#endif
	if (strEQ(name, "KADM5_CONFIG_ADMIN_KEYTAB"))
#ifdef KADM5_CONFIG_ADMIN_KEYTAB
	    return KADM5_CONFIG_ADMIN_KEYTAB;
#else
	    goto not_there;
#endif
	if (strEQ(name, "KADM5_CONFIG_ADMIN_SERVER"))
#ifdef KADM5_CONFIG_ADMIN_SERVER
	    return KADM5_CONFIG_ADMIN_SERVER;
#else
	    goto not_there;
#endif
	if (strEQ(name, "KADM5_CONFIG_DBNAME"))
#ifdef KADM5_CONFIG_DBNAME
	    return KADM5_CONFIG_DBNAME;
#else
	    goto not_there;
#endif
	if (strEQ(name, "KADM5_CONFIG_DICT_FILE"))
#ifdef KADM5_CONFIG_DICT_FILE
	    return KADM5_CONFIG_DICT_FILE;
#else
	    goto not_there;
#endif
	if (strEQ(name, "KADM5_CONFIG_ENCTYPE"))
#ifdef KADM5_CONFIG_ENCTYPE
	    return KADM5_CONFIG_ENCTYPE;
#else
	    goto not_there;
#endif
	if (strEQ(name, "KADM5_CONFIG_ENCTYPES"))
#ifdef KADM5_CONFIG_ENCTYPES
	    return KADM5_CONFIG_ENCTYPES;
#else
	    goto not_there;
#endif
	if (strEQ(name, "KADM5_CONFIG_EXPIRATION"))
#ifdef KADM5_CONFIG_EXPIRATION
	    return KADM5_CONFIG_EXPIRATION;
#else
	    goto not_there;
#endif
	if (strEQ(name, "KADM5_CONFIG_FLAGS"))
#ifdef KADM5_CONFIG_FLAGS
	    return KADM5_CONFIG_FLAGS;
#else
	    goto not_there;
#endif
	if (strEQ(name, "KADM5_CONFIG_KADMIND_PORT"))
#ifdef KADM5_CONFIG_KADMIND_PORT
	    return KADM5_CONFIG_KADMIND_PORT;
#else
	    goto not_there;
#endif
	if (strEQ(name, "KADM5_CONFIG_KPASSWD_PORT"))
#ifdef KADM5_CONFIG_KPASSWD_PORT
	    return KADM5_CONFIG_KPASSWD_PORT;
#else
	    goto not_there;
#endif
	if (strEQ(name, "KADM5_CONFIG_MAX_LIFE"))
#ifdef KADM5_CONFIG_MAX_LIFE
	    return KADM5_CONFIG_MAX_LIFE;
#else
	    goto not_there;
#endif
	if (strEQ(name, "KADM5_CONFIG_MAX_RLIFE"))
#ifdef KADM5_CONFIG_MAX_RLIFE
	    return KADM5_CONFIG_MAX_RLIFE;
#else
	    goto not_there;
#endif
	if (strEQ(name, "KADM5_CONFIG_MKEY_FROM_KBD"))
#ifdef KADM5_CONFIG_MKEY_FROM_KBD
	    return KADM5_CONFIG_MKEY_FROM_KBD;
#else
	    goto not_there;
#endif
	if (strEQ(name, "KADM5_CONFIG_MKEY_NAME"))
#ifdef KADM5_CONFIG_MKEY_NAME
	    return KADM5_CONFIG_MKEY_NAME;
#else
	    goto not_there;
#endif
	if (strEQ(name, "KADM5_CONFIG_PROFILE"))
#ifdef KADM5_CONFIG_PROFILE
	    return KADM5_CONFIG_PROFILE;
#else
	    goto not_there;
#endif
	if (strEQ(name, "KADM5_CONFIG_REALM"))
#ifdef KADM5_CONFIG_REALM
	    return KADM5_CONFIG_REALM;
#else
	    goto not_there;
#endif
	if (strEQ(name, "KADM5_CONFIG_STASH_FILE"))
#ifdef KADM5_CONFIG_STASH_FILE
	    return KADM5_CONFIG_STASH_FILE;
#else
	    goto not_there;
#endif
	if (strEQ(name, "KADM5_FAIL_AUTH_COUNT"))
#ifdef KADM5_FAIL_AUTH_COUNT
	    return KADM5_FAIL_AUTH_COUNT;
#else
	    goto not_there;
#endif
	if (strEQ(name, "KADM5_KEY_DATA"))
#ifdef KADM5_KEY_DATA
	    return KADM5_KEY_DATA;
#else
	    goto not_there;
#endif
	if (strEQ(name, "KADM5_KVNO"))
#ifdef KADM5_KVNO
	    return KADM5_KVNO;
#else
	    goto not_there;
#endif
	if (strEQ(name, "KADM5_LAST_FAILED"))
#ifdef KADM5_LAST_FAILED
	    return KADM5_LAST_FAILED;
#else
	    goto not_there;
#endif
	if (strEQ(name, "KADM5_LAST_PWD_CHANGE"))
#ifdef KADM5_LAST_PWD_CHANGE
	    return KADM5_LAST_PWD_CHANGE;
#else
	    goto not_there;
#endif
	if (strEQ(name, "KADM5_LAST_SUCCESS"))
#ifdef KADM5_LAST_SUCCESS
	    return KADM5_LAST_SUCCESS;
#else
	    goto not_there;
#endif
	if (strEQ(name, "KADM5_MASK_BITS"))
#ifdef KADM5_MASK_BITS
	    return KADM5_MASK_BITS;
#else
	    goto not_there;
#endif
	if (strEQ(name, "KADM5_MAX_LIFE"))
#ifdef KADM5_MAX_LIFE
	    return KADM5_MAX_LIFE;
#else
	    goto not_there;
#endif
	if (strEQ(name, "KADM5_MAX_RLIFE"))
#ifdef KADM5_MAX_RLIFE
	    return KADM5_MAX_RLIFE;
#else
	    goto not_there;
#endif
	if (strEQ(name, "KADM5_MKVNO"))
#ifdef KADM5_MKVNO
	    return KADM5_MKVNO;
#else
	    goto not_there;
#endif
	if (strEQ(name, "KADM5_MOD_NAME"))
#ifdef KADM5_MOD_NAME
	    return KADM5_MOD_NAME;
#else
	    goto not_there;
#endif
	if (strEQ(name, "KADM5_MOD_TIME"))
#ifdef KADM5_MOD_TIME
	    return KADM5_MOD_TIME;
#else
	    goto not_there;
#endif
	if (strEQ(name, "KADM5_OK"))
#ifdef KADM5_OK
	    return KADM5_OK;
#else
	    goto not_there;
#endif
	if (strEQ(name, "KADM5_POLICY"))
#ifdef KADM5_POLICY
	    return KADM5_POLICY;
#else
	    goto not_there;
#endif
	if (strEQ(name, "KADM5_POLICY_CLR"))
#ifdef KADM5_POLICY_CLR
	    return KADM5_POLICY_CLR;
#else
	    goto not_there;
#endif
	if (strEQ(name, "KADM5_PRINCIPAL"))
#ifdef KADM5_PRINCIPAL
	    return KADM5_PRINCIPAL;
#else
	    goto not_there;
#endif
	if (strEQ(name, "KADM5_PRINCIPAL_NORMAL_MASK"))
#ifdef KADM5_PRINCIPAL_NORMAL_MASK
	    return KADM5_PRINCIPAL_NORMAL_MASK;
#else
	    goto not_there;
#endif
	if (strEQ(name, "KADM5_PRINC_EXPIRE_TIME"))
#ifdef KADM5_PRINC_EXPIRE_TIME
	    return KADM5_PRINC_EXPIRE_TIME;
#else
	    goto not_there;
#endif
	if (strEQ(name, "KADM5_PRIV_ADD"))
#ifdef KADM5_PRIV_ADD
	    return KADM5_PRIV_ADD;
#else
	    goto not_there;
#endif
	if (strEQ(name, "KADM5_PRIV_DELETE"))
#ifdef KADM5_PRIV_DELETE
	    return KADM5_PRIV_DELETE;
#else
	    goto not_there;
#endif
	if (strEQ(name, "KADM5_PRIV_GET"))
#ifdef KADM5_PRIV_GET
	    return KADM5_PRIV_GET;
#else
	    goto not_there;
#endif
	if (strEQ(name, "KADM5_PRIV_MODIFY"))
#ifdef KADM5_PRIV_MODIFY
	    return KADM5_PRIV_MODIFY;
#else
	    goto not_there;
#endif
	if (strEQ(name, "KADM5_PW_EXPIRATION"))
#ifdef KADM5_PW_EXPIRATION
	    return KADM5_PW_EXPIRATION;
#else
	    goto not_there;
#endif
	if (strEQ(name, "KADM5_PW_HISTORY_NUM"))
#ifdef KADM5_PW_HISTORY_NUM
	    return KADM5_PW_HISTORY_NUM;
#else
	    goto not_there;
#endif
	if (strEQ(name, "KADM5_PW_MAX_LIFE"))
#ifdef KADM5_PW_MAX_LIFE
	    return KADM5_PW_MAX_LIFE;
#else
	    goto not_there;
#endif
	if (strEQ(name, "KADM5_PW_MIN_CLASSES"))
#ifdef KADM5_PW_MIN_CLASSES
	    return KADM5_PW_MIN_CLASSES;
#else
	    goto not_there;
#endif
	if (strEQ(name, "KADM5_PW_MIN_LENGTH"))
#ifdef KADM5_PW_MIN_LENGTH
	    return KADM5_PW_MIN_LENGTH;
#else
	    goto not_there;
#endif
	if (strEQ(name, "KADM5_PW_MIN_LIFE"))
#ifdef KADM5_PW_MIN_LIFE
	    return KADM5_PW_MIN_LIFE;
#else
	    goto not_there;
#endif
	if (strEQ(name, "KADM5_REF_COUNT"))
#ifdef KADM5_REF_COUNT
	    return KADM5_REF_COUNT;
#else
	    goto not_there;
#endif
	if (strEQ(name, "KADM5_STRUCT_VERSION"))
#ifdef KADM5_STRUCT_VERSION
	    return KADM5_STRUCT_VERSION;
#else
	    goto not_there;
#endif
	if (strEQ(name, "KADM5_STRUCT_VERSION_1"))
#ifdef KADM5_STRUCT_VERSION_1
	    return KADM5_STRUCT_VERSION_1;
#else
	    goto not_there;
#endif
	if (strEQ(name, "KADM5_STRUCT_VERSION_MASK"))
#ifdef KADM5_STRUCT_VERSION_MASK
	    return KADM5_STRUCT_VERSION_MASK;
#else
	    goto not_there;
#endif
	if (strEQ(name, "KADM5_TL_DATA"))
#ifdef KADM5_TL_DATA
	    return KADM5_TL_DATA;
#else
	    goto not_there;
#endif
	if (strEQ(name, "KRB5_KDB_DISALLOW_ALL_TIX"))
#ifdef KRB5_KDB_DISALLOW_ALL_TIX
	    return KRB5_KDB_DISALLOW_ALL_TIX;
#else
	    goto not_there;
#endif
	if (strEQ(name, "KRB5_KDB_DISALLOW_DUP_SKEY"))
#ifdef KRB5_KDB_DISALLOW_DUP_SKEY
	    return KRB5_KDB_DISALLOW_DUP_SKEY;
#else
	    goto not_there;
#endif
	if (strEQ(name, "KRB5_KDB_DISALLOW_FORWARDABLE"))
#ifdef KRB5_KDB_DISALLOW_FORWARDABLE
	    return KRB5_KDB_DISALLOW_FORWARDABLE;
#else
	    goto not_there;
#endif
	if (strEQ(name, "KRB5_KDB_DISALLOW_POSTDATED"))
#ifdef KRB5_KDB_DISALLOW_POSTDATED
	    return KRB5_KDB_DISALLOW_POSTDATED;
#else
	    goto not_there;
#endif
	if (strEQ(name, "KRB5_KDB_DISALLOW_PROXIABLE"))
#ifdef KRB5_KDB_DISALLOW_PROXIABLE
	    return KRB5_KDB_DISALLOW_PROXIABLE;
#else
	    goto not_there;
#endif
	if (strEQ(name, "KRB5_KDB_DISALLOW_RENEWABLE"))
#ifdef KRB5_KDB_DISALLOW_RENEWABLE
	    return KRB5_KDB_DISALLOW_RENEWABLE;
#else
	    goto not_there;
#endif
	if (strEQ(name, "KRB5_KDB_DISALLOW_SVR"))
#ifdef KRB5_KDB_DISALLOW_SVR
	    return KRB5_KDB_DISALLOW_SVR;
#else
	    goto not_there;
#endif
	if (strEQ(name, "KRB5_KDB_DISALLOW_TGT_BASED"))
#ifdef KRB5_KDB_DISALLOW_TGT_BASED
	    return KRB5_KDB_DISALLOW_TGT_BASED;
#else
	    goto not_there;
#endif
	if (strEQ(name, "KRB5_KDB_NEW_PRINC"))
#ifdef KRB5_KDB_NEW_PRINC
	    return KRB5_KDB_NEW_PRINC;
#else
	    goto not_there;
#endif
	if (strEQ(name, "KRB5_KDB_PWCHANGE_SERVICE"))
#ifdef KRB5_KDB_PWCHANGE_SERVICE
	    return KRB5_KDB_PWCHANGE_SERVICE;
#else
	    goto not_there;
#endif
	if (strEQ(name, "KRB5_KDB_REQUIRES_HW_AUTH"))
#ifdef KRB5_KDB_REQUIRES_HW_AUTH
	    return KRB5_KDB_REQUIRES_HW_AUTH;
#else
	    goto not_there;
#endif
	if (strEQ(name, "KRB5_KDB_REQUIRES_PRE_AUTH"))
#ifdef KRB5_KDB_REQUIRES_PRE_AUTH
	    return KRB5_KDB_REQUIRES_PRE_AUTH;
#else
	    goto not_there;
#endif
	if (strEQ(name, "KRB5_KDB_REQUIRES_PWCHANGE"))
#ifdef KRB5_KDB_REQUIRES_PWCHANGE
	    return KRB5_KDB_REQUIRES_PWCHANGE;
#else
	    goto not_there;
#endif
	if (strEQ(name, "KRB5_KDB_SUPPORT_DESMD5"))
#ifdef KRB5_KDB_SUPPORT_DESMD5
	    return KRB5_KDB_SUPPORT_DESMD5;
#else
	    goto not_there;
#endif
		break;
	}
	errno = EINVAL;
	return 0;

 not_there:
	errno = ENOENT;
	return 0;
}

static kadm5_ret_t err;

struct kadm5_policy_mit {
       kadm5_policy_ent_rec	policy;
       long			mask;
};

struct kadm5_principal_mit {
       kadm5_principal_ent_rec	 kadm5_princ;
       SV			*krb5_princ;
       SV			*krb5_princ_mod;
       long			 mask;
};

typedef kadm5_config_params		*Authen__Krb5__Admin__Config;
typedef krb5_ccache			 Authen__Krb5__Ccache;
typedef krb5_keyblock			*Authen__Krb5__Admin__Keyblock;
typedef krb5_principal			 Authen__Krb5__Principal;
typedef struct kadm5_policy_mit		*Authen__Krb5__Admin__Policy;
typedef struct kadm5_principal_mit	*Authen__Krb5__Admin__Principal;
typedef void				*Authen__Krb5__Admin;

MODULE = Authen::Krb5::Admin	PACKAGE = Authen::Krb5::Admin	PREFIX = kadm5_

double
constant(name, arg)
	char	*name
	int	 arg

void
kadm5_chpass_principal(handle, princ, pw)
	Authen::Krb5::Admin	 handle
	Authen::Krb5::Principal	 princ
	char			*pw
    CODE:
	err = kadm5_chpass_principal(handle, princ, pw);
	if (err)
		XSRETURN_UNDEF;
	XSRETURN_YES;

void
kadm5_create_policy(handle, policy)
	Authen::Krb5::Admin		 handle
	Authen::Krb5::Admin::Policy	 policy
    CODE:
	err = kadm5_create_policy(handle, &policy->policy, policy->mask);
	if (err)
		XSRETURN_UNDEF;
	XSRETURN_YES;

void
kadm5_create_principal(handle, princ, pw = "")
	Authen::Krb5::Admin		 handle
	Authen::Krb5::Admin::Principal	 princ
	char				*pw
    CODE:
	err = kadm5_create_principal(handle, &princ->kadm5_princ,
	    princ->mask & ~(KADM5_POLICY_CLR | KADM5_FAIL_AUTH_COUNT), pw);
	if (err)
		XSRETURN_UNDEF;
	XSRETURN_YES;

void
kadm5_delete_policy(handle, name)
	Authen::Krb5::Admin	 handle
	char			*name
    CODE:
	err = kadm5_delete_policy(handle, name);
	if (err)
		XSRETURN_UNDEF;
	XSRETURN_YES;

void
kadm5_delete_principal(handle, princ)
	Authen::Krb5::Admin	handle
	Authen::Krb5::Principal	princ
    CODE:
	err = kadm5_delete_principal(handle, princ);
	if (err)
		XSRETURN_UNDEF;
	XSRETURN_YES;

void
kadm5_error(e = 0)
	kadm5_ret_t	e;
    CODE:
	if (e)
		ST(0) = sv_2mortal(newSVpv((char *)error_message(e), 0));
	else {
		ST(0) = sv_2mortal(newSVpv((char *)error_message(err), 0));
		SvUPGRADE(ST(0), SVt_PVIV);
		SvIVX(ST(0)) = err;
		SvIOK_on(ST(0));
	}

Authen::Krb5::Admin::Policy
kadm5_get_policy(handle, name = "default")
	Authen::Krb5::Admin	 handle
	char			*name
    CODE:
	Newz(0, RETVAL, 1, struct kadm5_policy_mit);
	err = kadm5_get_policy(handle, name, &RETVAL->policy);
	if (err)
		XSRETURN_UNDEF;
    OUTPUT:
	RETVAL

void
kadm5_get_policies(handle, exp = NULL)
	Authen::Krb5::Admin	 handle
	char			*exp
    PREINIT:
	char	**pols;
	int	  count;
	int	  i;
    PPCODE:
	err = kadm5_get_policies(handle, exp, &pols, &count);
	if (err)
		XSRETURN_EMPTY;
	EXTEND(sp, count);
	for (i = 0; i < count; i++)
		PUSHs(sv_2mortal(newSVpv(pols[i], 0)));
	kadm5_free_name_list(handle, pols, count);
	XSRETURN(count);

Authen::Krb5::Admin::Principal
kadm5_get_principal(handle, krb5_princ, mask = KADM5_PRINCIPAL_NORMAL_MASK)
	Authen::Krb5::Admin	handle
	Authen::Krb5::Principal	krb5_princ
	long			mask
    CODE:
	Newz(0, RETVAL, 1, struct kadm5_principal_mit);	
	err = kadm5_get_principal(handle, krb5_princ, &RETVAL->kadm5_princ,
	    mask);
	if (err)
		XSRETURN_UNDEF;
	RETVAL->krb5_princ = newSViv((IV) RETVAL->kadm5_princ.principal);
	RETVAL->krb5_princ_mod =
	    newSViv((IV) RETVAL->kadm5_princ.mod_name);
    OUTPUT:
	RETVAL

void
kadm5_get_principals(handle, exp = NULL)
	Authen::Krb5::Admin	 handle
	char			*exp
    PREINIT:
	char	**princs;
	int	  count;
	int	  i;
    PPCODE:
	err = kadm5_get_principals(handle, exp, &princs, &count);
	if (err)
		XSRETURN_EMPTY;
	EXTEND(sp, count);
	for (i = 0; i < count; i++)
		PUSHs(sv_2mortal(newSVpv(princs[i], 0)));
	kadm5_free_name_list(handle, princs, count);
	XSRETURN(count);

void
kadm5_get_privs(handle)
	Authen::Krb5::Admin	handle
    PREINIT:
	long	privs;
    CODE:
	err = kadm5_get_privs(handle, &privs);
	ST(0) = err ? &PL_sv_undef : sv_2mortal(newSViv(privs));

Authen::Krb5::Admin
kadm5_init_with_creds(CLASS, client, cc, service = KADM5_ADMIN_SERVICE, config = NULL, struct_version = KADM5_STRUCT_VERSION, api_version = KADM5_API_VERSION_2)
	char				*CLASS
	char				*client
	Authen::Krb5::Ccache		 cc
	char				*service
	Authen::Krb5::Admin::Config	 config
	krb5_ui_4			 struct_version
	krb5_ui_4			 api_version
    CODE:
	err = kadm5_init_with_creds(client, cc, service, config,
	    struct_version, api_version, &RETVAL);
	if (err)
		XSRETURN_UNDEF;
    OUTPUT:
	RETVAL

Authen::Krb5::Admin
kadm5_init_with_password(CLASS, client, pw = NULL, service = KADM5_ADMIN_SERVICE, config = NULL, struct_version = KADM5_STRUCT_VERSION, api_version = KADM5_API_VERSION_2)
	char				*CLASS
	char				*client
	char				*pw
	char				*service
	Authen::Krb5::Admin::Config	 config
	krb5_ui_4			 struct_version
	krb5_ui_4			 api_version
    CODE:
	err = kadm5_init_with_password(client, pw, service, config,
	    struct_version, api_version, &RETVAL);
	if (err)
		XSRETURN_UNDEF;
    OUTPUT:
	RETVAL

Authen::Krb5::Admin
kadm5_init_with_skey(CLASS, client, keytab = NULL, service = KADM5_ADMIN_SERVICE, config = NULL, struct_version = KADM5_STRUCT_VERSION, api_version = KADM5_API_VERSION_2)
	char				*CLASS
	char				*client
	char				*keytab
	char				*service
	Authen::Krb5::Admin::Config	 config
	krb5_ui_4			 struct_version
	krb5_ui_4			 api_version
    CODE:
	err = kadm5_init_with_skey(client, keytab, service, config,
	    struct_version, api_version, &RETVAL);
	if (err)
		XSRETURN_UNDEF;
    OUTPUT:
	RETVAL

void
kadm5_modify_policy(handle, policy)
	Authen::Krb5::Admin		handle
	Authen::Krb5::Admin::Policy	policy
    CODE:
	err = kadm5_modify_policy(handle, &policy->policy,
	    policy->mask & ~KADM5_POLICY);
	if (err)
		XSRETURN_UNDEF;
	XSRETURN_YES;

void
kadm5_modify_principal(handle, princ)
	Authen::Krb5::Admin		handle
	Authen::Krb5::Admin::Principal	princ
    CODE:
	err = kadm5_modify_principal(handle, &princ->kadm5_princ,
	    princ->mask & ~KADM5_PRINCIPAL);
	if (err)
		XSRETURN_UNDEF;
	XSRETURN_YES;

void
kadm5_randkey_principal(handle, princ)
	Authen::Krb5::Admin	handle
	Authen::Krb5::Principal	princ
    PREINIT:
	krb5_keyblock	*keys;
	int		 count, i;
    PPCODE:
	err = kadm5_randkey_principal(handle, princ, &keys, &count);
	if (err)
		XSRETURN_EMPTY;
	EXTEND(sp, count);
	for (i = 0; i < count; i++) {
		ST(i) = sv_newmortal();
		sv_setref_pv(ST(i), "Authen::Krb5::Admin::Keyblock",
		    &keys[i]);
	}
	XSRETURN(count);

void
DESTROY(handle)
	Authen::Krb5::Admin	handle
    CODE:
	err = kadm5_destroy(handle);
	if (err)	
		XSRETURN_UNDEF;
	XSRETURN_YES;

MODULE = Authen::Krb5::Admin	PACKAGE = Authen::Krb5::Admin::Config

Authen::Krb5::Admin::Config
new(CLASS)
	char	*CLASS
    CODE:
	Newz(0, RETVAL, 1, kadm5_config_params);
    OUTPUT:
	RETVAL

char *
admin_server(config, ...)
	Authen::Krb5::Admin::Config	config
    PROTOTYPE: $;$
    PREINIT:
	STRLEN len;
    CODE:
	if (items > 1) {
		char	*admin_server;
		admin_server = SvPV(ST(1), len);
		if (config->admin_server) {
			Safefree(config->admin_server);
			config->admin_server = NULL;
		}
		New(0, config->admin_server, len + 1, char);
		Copy(admin_server, config->admin_server, len + 1, char);
		config->mask |= KADM5_CONFIG_ADMIN_SERVER;
	}
	ST(0) = config->admin_server
	    ? sv_2mortal(newSVpv(config->admin_server, 0))
	    : &PL_sv_undef;

long
kadmind_port(config, ...)
	Authen::Krb5::Admin::Config	config
    PROTOTYPE: $;$
    CODE:
	if (items > 1) {
		config->kadmind_port = SvIV(ST(1));
		config->mask |= KADM5_CONFIG_KADMIND_PORT;
	}
	RETVAL = config->kadmind_port;
    OUTPUT:
	RETVAL

long
kpasswd_port(config, ...)
	Authen::Krb5::Admin::Config	config
    PROTOTYPE: $;$
    CODE:
	if (items > 1) {
		config->kpasswd_port = SvIV(ST(1));
		config->mask |= KADM5_CONFIG_KPASSWD_PORT;
	}
	RETVAL = config->kpasswd_port;
    OUTPUT:
	RETVAL

long
mask(config, ...)
	Authen::Krb5::Admin::Config	config
    PROTOTYPE: $;$
    CODE:
	if (items > 1)
		config->mask = SvIV(ST(1));
	RETVAL = config->mask;
    OUTPUT:
	RETVAL

char *
profile(config, ...)
	Authen::Krb5::Admin::Config	config
    PROTOTYPE: $;$
    PREINIT:
	STRLEN len;
    CODE:
	if (items > 1) {
		char	*profile;
		profile = SvPV(ST(1), len);
		if (config->profile) {
			Safefree(config->profile);
			config->profile = NULL;
		}
		New(0, config->profile, len + 1, char);
		Copy(profile, config->profile, len + 1, char);
		config->mask |= KADM5_CONFIG_PROFILE;
	}
	ST(0) = config->profile
	    ? sv_2mortal(newSVpv(config->profile, 0))
	    : &PL_sv_undef;

char *
realm(config, ...)
	Authen::Krb5::Admin::Config	config
    PROTOTYPE: $;$
    PREINIT:
	STRLEN len;
    CODE:
	if (items > 1) {
		char	*realm;
		realm = SvPV(ST(1), len);
		if (config->realm) {
			Safefree(config->realm);
			config->realm = NULL;
		}
		New(0, config->realm, len + 1, char);
		Copy(realm, config->realm, len + 1, char);
		config->mask |= KADM5_CONFIG_REALM;
	}
	ST(0) = config->realm
	    ? sv_2mortal(newSVpv(config->realm, 0))
	    : &PL_sv_undef;

void
DESTROY(config)
	Authen::Krb5::Admin::Config	config
    CODE:
	Safefree(config);

MODULE = Authen::Krb5::Admin	PACKAGE = Authen::Krb5::Admin::Keyblock

void
DESTROY(keyblock)
	Authen::Krb5::Admin::Keyblock	keyblock
    CODE:
	if (keyblock->contents) {
		memset(keyblock->contents, 0, keyblock->length);
		free(keyblock->contents);
		keyblock->contents = NULL;
	}

MODULE = Authen::Krb5::Admin	PACKAGE = Authen::Krb5::Admin::Policy

Authen::Krb5::Admin::Policy
new(CLASS)
	char	*CLASS
    CODE:
	Newz(0, RETVAL, 1, struct kadm5_policy_mit);
    OUTPUT:
	RETVAL

long
mask(policy, ...)
	Authen::Krb5::Admin::Policy	policy
    PROTOTYPE: $;$
    CODE:
	if (items > 1)
		policy->mask = SvIV(ST(1));
	RETVAL = policy->mask;
    OUTPUT:
	RETVAL

void
name(policy, ...)
	Authen::Krb5::Admin::Policy	policy
    PROTOTYPE: $;$
    PREINIT:
	STRLEN len;
    CODE:
	if (items > 1) {
		char	*source;
		source = SvPV(ST(1), len);
		if (policy->policy.policy) {
			Safefree(policy->policy.policy);
			policy->policy.policy = NULL;
		}
		New(0, policy->policy.policy, len + 1, char);
		Copy(source, policy->policy.policy, len + 1, char);
		policy->mask |= KADM5_POLICY;
	}
	ST(0) = policy->policy.policy
	    ? sv_2mortal(newSVpv(policy->policy.policy, 0))
	    : &PL_sv_undef;

long
pw_history_num(policy, ...)
	Authen::Krb5::Admin::Policy	policy
    PROTOTYPE: $;$
    CODE:
	if (items > 1) {
		policy->policy.pw_history_num = SvIV(ST(1));
		policy->mask |= KADM5_PW_HISTORY_NUM;
	}
	RETVAL = policy->policy.pw_history_num;
    OUTPUT:
	RETVAL

long
pw_max_life(policy, ...)
	Authen::Krb5::Admin::Policy	policy
    PROTOTYPE: $;$
    CODE:
	if (items > 1) {
		policy->policy.pw_max_life = SvIV(ST(1));
		policy->mask |= KADM5_PW_MAX_LIFE;
	}
	RETVAL = policy->policy.pw_max_life;
    OUTPUT:
	RETVAL

long
pw_min_classes(policy, ...)
	Authen::Krb5::Admin::Policy	policy
    PROTOTYPE: $;$
    CODE:
	if (items > 1) {
		policy->policy.pw_min_classes = SvIV(ST(1));
		policy->mask |= KADM5_PW_MIN_CLASSES;
	}
	RETVAL = policy->policy.pw_min_classes;
    OUTPUT:
	RETVAL

long
pw_min_length(policy, ...)
	Authen::Krb5::Admin::Policy	policy
    PROTOTYPE: $;$
    CODE:
	if (items > 1) {
		policy->policy.pw_min_length = SvIV(ST(1));
		policy->mask |= KADM5_PW_MIN_LENGTH;
	}
	RETVAL = policy->policy.pw_min_length;
    OUTPUT:
	RETVAL

long
pw_min_life(policy, ...)
	Authen::Krb5::Admin::Policy	policy
    PROTOTYPE: $;$
    CODE:
	if (items > 1) {
		policy->policy.pw_min_life = SvIV(ST(1));
		policy->mask |= KADM5_PW_MIN_LIFE;
	}
	RETVAL = policy->policy.pw_min_life;
    OUTPUT:
	RETVAL

long
policy_refcnt(policy, ...)
	Authen::Krb5::Admin::Policy	policy
    PROTOTYPE: $;$
    CODE:
	if (items > 1)
		policy->policy.policy_refcnt = SvIV(ST(1));
	RETVAL = policy->policy.policy_refcnt;
    OUTPUT:
	RETVAL

void
DESTROY(policy)
	Authen::Krb5::Admin::Policy	policy
    CODE:
	if (policy->policy.policy) {
		Safefree(policy->policy.policy);
		policy->policy.policy = NULL;
	}
	Safefree(policy);

MODULE = Authen::Krb5::Admin	PACKAGE = Authen::Krb5::Admin::Principal

Authen::Krb5::Admin::Principal
new(CLASS)
	char	*CLASS
    CODE:
	Newz(0, RETVAL, 1, struct kadm5_principal_mit);
	if (!RETVAL)
		XSRETURN_UNDEF;
    OUTPUT:
	RETVAL

krb5_flags
attributes(princ, ...)
	Authen::Krb5::Admin::Principal	princ
    PROTOTYPE: $;$
    CODE:
	if (items > 1) {
		princ->kadm5_princ.attributes = SvIV(ST(1));
		princ->mask |= KADM5_ATTRIBUTES;
	}
	RETVAL = princ->kadm5_princ.attributes;
    OUTPUT:
	RETVAL

long
aux_attributes(princ, ...)
	Authen::Krb5::Admin::Principal	princ
    PROTOTYPE: $;$
    CODE:
	if (items > 1)
		princ->kadm5_princ.aux_attributes = SvIV(ST(1));
	RETVAL = princ->kadm5_princ.aux_attributes;
    OUTPUT:
	RETVAL

krb5_kvno
fail_auth_count(princ, ...)
	Authen::Krb5::Admin::Principal	princ
    PROTOTYPE: $;$
    CODE:
	if (items > 1) {
		princ->kadm5_princ.fail_auth_count = SvIV(ST(1));
		princ->mask |= KADM5_FAIL_AUTH_COUNT;
	}
	RETVAL = princ->kadm5_princ.fail_auth_count;
    OUTPUT:
	RETVAL

krb5_kvno
kvno(princ, ...)
	Authen::Krb5::Admin::Principal	princ
    PROTOTYPE: $;$
    CODE:
	if (items > 1) {
		princ->kadm5_princ.kvno = SvIV(ST(1));
		princ->mask |= KADM5_KVNO;
	}
	RETVAL = princ->kadm5_princ.kvno;
    OUTPUT:
	RETVAL

krb5_timestamp
last_failed(princ, ...)
	Authen::Krb5::Admin::Principal	princ
    PROTOTYPE: $;$
    CODE:
	if (items > 1)
		princ->kadm5_princ.last_failed = SvIV(ST(1));
	RETVAL = princ->kadm5_princ.last_failed;
    OUTPUT:
	RETVAL

krb5_timestamp
last_pwd_change(princ, ...)
	Authen::Krb5::Admin::Principal	princ
    PROTOTYPE: $;$
    CODE:
	if (items > 1)
		princ->kadm5_princ.last_pwd_change = SvIV(ST(1));
	RETVAL = princ->kadm5_princ.last_pwd_change;
    OUTPUT:
	RETVAL

krb5_timestamp
last_success(princ, ...)
	Authen::Krb5::Admin::Principal	princ
    PROTOTYPE: $;$
    CODE:
	if (items > 1)
		princ->kadm5_princ.last_success = SvIV(ST(1));
	RETVAL = princ->kadm5_princ.last_success;
    OUTPUT:
	RETVAL

long
mask(princ, ...)
	Authen::Krb5::Admin::Principal	princ
    PROTOTYPE: $;$
    CODE:
	if (items > 1)
		princ->mask = SvIV(ST(1));
	RETVAL = princ->mask;
    OUTPUT:
	RETVAL

krb5_deltat
max_life(princ, ...)
	Authen::Krb5::Admin::Principal	princ
    PROTOTYPE: $;$
    CODE:
	if (items > 1) {
		princ->kadm5_princ.max_life = SvIV(ST(1));
		princ->mask |= KADM5_MAX_LIFE;
	}
	RETVAL = princ->kadm5_princ.max_life;
    OUTPUT:
	RETVAL

krb5_deltat
max_renewable_life(princ, ...)
	Authen::Krb5::Admin::Principal	princ
    PROTOTYPE: $;$
    CODE:
	if (items > 1) {
		princ->kadm5_princ.max_renewable_life = SvIV(ST(1));
		princ->mask |= KADM5_MAX_RLIFE;
	}
	RETVAL = princ->kadm5_princ.max_renewable_life;
    OUTPUT:
	RETVAL

krb5_kvno
mkvno(princ, ...)
	Authen::Krb5::Admin::Principal	princ
    PROTOTYPE: $;$
    CODE:
	if (items > 1)
		princ->kadm5_princ.mkvno = SvIV(ST(1));
	RETVAL = princ->kadm5_princ.mkvno;
    OUTPUT:
	RETVAL

krb5_timestamp
mod_date(princ, ...)
	Authen::Krb5::Admin::Principal	princ
    PROTOTYPE: $;$
    CODE:
	if (items > 1)
		princ->kadm5_princ.mod_date = SvIV(ST(1));
	RETVAL = princ->kadm5_princ.mod_date;
    OUTPUT:
	RETVAL

void
mod_name(princ, ...)
	Authen::Krb5::Admin::Principal	princ
    PROTOTYPE: $;$
    CODE:
	if (items > 1) {
		if (princ->krb5_princ_mod && SvIOK(princ->krb5_princ_mod))
			SvREFCNT_dec(princ->krb5_princ_mod);
		princ->krb5_princ_mod = SvRV(ST(1));
		princ->kadm5_princ.principal =
		    (krb5_principal) SvIV(princ->krb5_princ_mod);
		SvREFCNT_inc(princ->krb5_princ_mod);
	}
	ST(0) = newRV(princ->krb5_princ_mod);
	sv_bless(ST(0), gv_stashpv("Authen::Krb5::Principal", 0));

char *
policy(princ, ...)
	Authen::Krb5::Admin::Principal	princ
    PROTOTYPE: $;$
    PREINIT:
	STRLEN len;
    CODE:
	if (items > 1) {
		char	*policy;
		policy = SvPV(ST(1), len);
		if (princ->kadm5_princ.policy) {
			Safefree(princ->kadm5_princ.policy);
			princ->kadm5_princ.policy = NULL;
		}
		New(0, princ->kadm5_princ.policy, len + 1, char);
		Copy(policy, princ->kadm5_princ.policy, len + 1, char);
		princ->mask |= KADM5_POLICY;
		princ->mask &= ~KADM5_POLICY_CLR;
	}
	ST(0) = princ->kadm5_princ.policy
	    ? sv_2mortal(newSVpv(princ->kadm5_princ.policy, 0))
	    : &PL_sv_undef;

void
policy_clear(princ)
	Authen::Krb5::Admin::Principal	princ
    CODE:
	if (princ->kadm5_princ.policy) {
		Safefree(princ->kadm5_princ.policy);
		princ->kadm5_princ.policy = NULL;
	}
	princ->mask &= ~KADM5_POLICY;
	princ->mask |= KADM5_POLICY_CLR;

krb5_timestamp
princ_expire_time(princ, ...)
	Authen::Krb5::Admin::Principal	princ
    PROTOTYPE: $;$
    CODE:
	if (items > 1) {
		princ->kadm5_princ.princ_expire_time = SvIV(ST(1));
		princ->mask |= KADM5_PRINC_EXPIRE_TIME;
	}
	RETVAL = princ->kadm5_princ.princ_expire_time;
    OUTPUT:
	RETVAL

void
principal(princ, ...)
	Authen::Krb5::Admin::Principal	princ
    PROTOTYPE: $;$
    CODE:
	if (items > 1) {
		if (princ->krb5_princ && SvIOK(princ->krb5_princ))
			SvREFCNT_dec(princ->krb5_princ);
		princ->krb5_princ = SvRV(ST(1));
		princ->kadm5_princ.principal =
		    (krb5_principal) SvIV(princ->krb5_princ);
		SvREFCNT_inc(princ->krb5_princ);
		princ->mask |= KADM5_PRINCIPAL;
	}
	ST(0) = newRV(princ->krb5_princ);
	sv_bless(ST(0), gv_stashpv("Authen::Krb5::Principal", 0));

krb5_timestamp
pw_expiration(princ, ...)
	Authen::Krb5::Admin::Principal	princ
    PROTOTYPE: $;$
    CODE:
	if (items > 1) {
		princ->kadm5_princ.pw_expiration = SvIV(ST(1));
		princ->mask |= KADM5_PW_EXPIRATION;
	}
	RETVAL = princ->kadm5_princ.pw_expiration;
    OUTPUT:
	RETVAL

void
DESTROY(princ)
	Authen::Krb5::Admin::Principal	princ
    CODE:
	if (princ->krb5_princ && SvIOK(princ->krb5_princ))
		SvREFCNT_dec(princ->krb5_princ);
	if (princ->krb5_princ_mod && SvROK(princ->krb5_princ_mod))
		SvREFCNT_dec(princ->krb5_princ_mod);
	if (princ->kadm5_princ.policy) {
		Safefree(princ->kadm5_princ.policy);
		princ->kadm5_princ.policy = NULL;
	}
	Safefree(princ);
