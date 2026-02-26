  data "azurerm_client_config" "current" {}



  resource "azurerm_key_vault" "kv" {
    for_each                    = var.keyvault
    name                        = each.value.key_vault_name
    location                    = each.value.location
    resource_group_name         = each.value.resource_group_name
    enabled_for_disk_encryption = true
    tenant_id                   = data.azurerm_client_config.current.tenant_id
    soft_delete_retention_days  = 7
    purge_protection_enabled    = false
    rbac_authorization_enabled  = true

    sku_name = "standard"

    
  }

    resource "azurerm_role_assignment" "kv_access" {
    for_each = var.keyvault
    scope                = azurerm_key_vault.kv[each.key].id
    role_definition_name = "Key Vault Secrets Officer"
    principal_id         = data.azurerm_client_config.current.object_id
  }


  # resource "azurerm_key_vault_secret" "kvs" {
  #   for_each = var.kvs
  #   name         = each.value.secret_user
  #   value        = each.value.secret_pass
  #   key_vault_id = azurerm_key_vault.kv["kv1"].id
  #   key_vault_id = azurerm_key_vault.kv[each.value.vault_key].id
  #   key_vault_id = azurerm_key_vault.kv[each.key].id
  # }





  # resource "azurerm_key_vault_secret" "username" {
  #   for_each = var.username
  #   name         = each.value.username
  #   value        = each.value.value
  #   # key_vault_id = azurerm_key_vault.kv["kv1"].id
  #   key_vault_id = azurerm_key_vault.kv[each.key].id
  # }

  # resource "azurerm_key_vault_secret" "password" {
  #   for_each = var.password
  #   name         = each.value.password_name
  #   value        = each.value.value
  #   # key_vault_id = azurerm_key_vault.kv["kv1"].id
  #   key_vault_id = azurerm_key_vault.kv[each.key].id
  # }

