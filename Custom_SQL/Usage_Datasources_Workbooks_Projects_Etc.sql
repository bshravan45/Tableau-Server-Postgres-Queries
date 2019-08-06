SELECT DISTINCT
T55.asset_key_id AS "Asset_Key_ID (DS)",
T55.connectable AS "Connectable (DS)",
T55.content_version AS "Content_Version (DS)",
T55.created_at AS "Created_At (DS)",
T55.data_engine_extracts AS "Data_Engine_Extracts (DS)",
T55.data_id AS "Data_ID (DS)",
T55.db_class AS "Db_Class (DS)",
T55.db_name AS "Db_Name (DS)",
T55.description AS "Description (DS)",
T55.document_version AS "Document_Version (DS)",
T55.embedded AS "Embedded (DS)",
T55.extracts_incremented_at AS "Extracts_Incremented_At (DS)",
T55.extracts_refreshed_at AS "Extracts_Refreshed_At (DS)",
T55.first_published_at AS "First_Published_At (DS)",
T55.hidden_name AS "Hidden_Name (DS)",
T55.id AS "Id (DS)",
T55.incrementable_extracts AS "Incrementable_Extracts (DS)",
T55.is_certified AS "Is_Certified (DS)",
T55.is_hierarchical AS "Is_Hierarchical (DS)",
T55.last_published_at AS "Last_Published_At (DS)",
T55.lock_version AS "Lock_Version (DS)",
T55.luid AS "Luid (DS)",
T55.name AS "Name (DS)",
T55.owner_id AS "Owner_ID (DS)",
T55.parent_workbook_id AS "Parent_Workbook_ID (DS)",
T55.project_id AS "Project_ID (DS)",
T55.reduced_data_id AS "Reduced_Data_ID (DS)",
T55.refreshable_extracts AS "Refreshable_Extracts (DS)",
T55.remote_query_agent_id AS "Remote_Query_Agent_ID (DS)",
T55.repository_data_id AS "Repository_Data_ID (DS)",
T55.repository_extract_data_id AS "Repository_Extract_Data_ID (DS)",
T55.repository_url AS "Repository_Url (DS)",
T55.revision AS "Revision (DS)",
T55.site_id AS "Site_ID (DS)",
T55.size AS "Size (DS)",
T55.state AS "State (DS)",
T55.table_name AS "Table_Name (DS)",
T55.updated_at AS "Updated_At (DS)",
CASE WHEN T55_dc.id IS NULL THEN 'Embedded' ELSE 'Standalone' END AS "Embedded_In_Workbook (DS)" ,
-- <--- BEGIN OPTIONAL ALL DATASOURCES COLUMNS --->
-- Include to get all Datasources: Published and Embedded
CASE WHEN T55_dc.dbclass = 'sqlproxy' THEN true ELSE false END AS "References_Published_Data_Source (DS)" ,
COALESCE(T49_dc.has_extract,T55.data_engine_extracts) AS "Has_Extract (DS Embedded)" ,
CASE WHEN T49_dc.id IS NULL THEN '' ELSE CONCAT('https://example.com/#/datasources/',T49_dc.id,'/connections') END AS "Datasource URL (DS Embedded)",
-- Published Datasources - Is the Datasource Published Seperately to Tableau Server
CASE T55_dc.dbclass WHEN 'sqlproxy' THEN T55_ds.id ELSE T55.id END AS "Id (DS Published)", -- Published Datasource ID.  For workbooks which use a published datasource, take that ID rather than the Datasource ID referenced by the workbook.
CASE T55_dc.dbclass WHEN 'sqlproxy' THEN T55_ds.data_engine_extracts ELSE T55.data_engine_extracts END AS "Data_Engine_Extracts (DS Published)",
CASE T55_dc.dbclass WHEN 'sqlproxy' THEN T55_ds.refreshable_extracts ELSE T55.refreshable_extracts END AS "Refreshable (DS Published)",
CASE T55_dc.dbclass WHEN 'sqlproxy' THEN T55_ds.incrementable_extracts ELSE T55.incrementable_extracts END AS "Incrementable_Extracts (DS Published)",
CASE T55_dc.dbclass WHEN 'sqlproxy' THEN T55_ds.extracts_refreshed_at ELSE T55.extracts_refreshed_at END AS "Extracts_Refreshed_At (DS Published)",
CASE T55_dc.dbclass WHEN 'sqlproxy' THEN T55_ds.extracts_incremented_at ELSE T55.extracts_incremented_at END AS "Extracts_Incremented_At (DS Published)",
CASE T55_dc.dbclass WHEN 'sqlproxy' THEN T55_ds.name ELSE T55.name END AS "Name (DS Published)",
CASE T55_dc.dbclass WHEN 'sqlproxy' THEN T55_ds.owner_id ELSE T55.owner_id END AS "Owner_ID (DS Published)",
CASE T55_dc.dbclass WHEN 'sqlproxy' THEN T55_ds.project_id ELSE T55.project_id END AS "Project_ID (DS Published)",
CASE T55_dc.dbclass WHEN 'sqlproxy' THEN T55_ds.db_class ELSE T55.db_class END AS "Db_Class (DS Published)",
CASE T55_dc.dbclass WHEN 'sqlproxy' THEN T55_ds.db_name ELSE T55.db_name END AS "Db_Name (DS Published)",
CASE T55_dc.dbclass WHEN 'sqlproxy' THEN T55_ds.table_name ELSE T55.table_name END AS "Table_Name (DS Published)",
CASE T55_dc.dbclass WHEN 'sqlproxy' THEN T55_ds.is_hierarchical ELSE T55.is_hierarchical END AS "Is_Hierarchical (DS Published)",
CASE T55_dc.dbclass WHEN 'sqlproxy' THEN T55_ds.is_certified ELSE T55.is_certified END AS "Is_Certified (DS Published)",
CASE WHEN T55_URL.data_connection_id IS NULL THEN '' ELSE CONCAT('https://example.com/#/datasources/',T55_URL.data_connection_id,'/connections') END AS "Datasource URL (DS Published)",
T55_ds.repository_url AS "Repository_Url (DS Published)",
-- <--- END OPTIONAL ALL DATASOURCES COLUMNS --->
T301.asset_key_id AS "Asset_Key_ID (WB)",
T301.checksum AS "Checksum (WB)",
T301.content_version AS "Content_Version (WB)",
T301.created_at AS "Created_At (WB)",
T301.data_engine_extracts AS "Data_Engine_Extracts (WB)",
T301.data_id AS "Data_ID (WB)",
T301.default_view_index AS "Default_View_Index (WB)",
T301.description AS "Description (WB)",
T301.display_tabs AS "Display_Tabs (WB)",
T301.document_version AS "Document_Version (WB)",
--T301.embedded AS "Embedded (WB)",--Possible this field exceeds 8000 characters resulting in Postgres Error -- Github Issue #2
T301.extracts_incremented_at AS "Extracts_Incremented_At (WB)",
T301.extracts_refreshed_at AS "Extracts_Refreshed_At (WB)",
T301.first_published_at AS "First_Published_At (WB)",
T301.id AS "Id (WB)",
T301.incrementable_extracts AS "Incrementable_Extracts (WB)",
T301.last_published_at AS "Last_Published_At (WB)",
T301.lock_version AS "Lock_Version (WB)",
T301.luid AS "Luid (WB)",
T301.name AS "Name (WB)",
T301.owner_id AS "Owner_ID (WB)",
T301.primary_content_url AS "Primary_Content_Url (WB)",
T301.project_id AS "Project_ID (WB)",
T301.published_all_sheets AS "Published_All_Sheets (WB)",
T301.reduced_data_id AS "Reduced_Data_ID (WB)",
T301.refreshable_extracts AS "Refreshable_Extracts (WB)",
T301.repository_data_id AS "Repository_Data_ID (WB)",
T301.repository_extract_data_id AS "Repository_Extract_Data_ID (WB)",
T301.repository_url AS "Repository_Url (WB)",
T301.revision AS "Revision (WB)",
T301.share_description AS "Share_Description (WB)",
T301.show_toolbar AS "Show_Toolbar (WB)",
T301.site_id AS "Site_ID (WB)",
T301.size AS "Size (WB)",
T301.state AS "State (WB)",
T301.thumb_user AS "Thumb_User (WB)",
T301.updated_at AS "Updated_At (WB)",
T301.version AS "Version (WB)",
T301.view_count AS "View_Count (WB)",
T227.controlled_permissions_enabled AS "Controlled_Permissions_Enabled (Projects)",
T227.created_at AS "Created_At (Projects)",
T227.description AS "Description (Projects)",
T227.id AS "Id (Projects)",
T227.luid AS "Luid (Projects)",
T227.name AS "Name (Projects)",
T227.owner_id AS "Owner_ID (Projects)",
T227.site_id AS "Site_ID (Projects)",
T227.special AS "Special (Projects)",
T227.state AS "State (Projects)",
T227.updated_at AS "Updated_At (Projects)",
T271_workbook_owner.activated_at AS "Activated_At (WB Sys Users)",
T271_workbook_owner.activation_code AS "Activation_Code (WB Sys Users)",
T271_workbook_owner.admin_level AS "Admin_Level (WB Sys Users)",
T271_workbook_owner.asset_key_id AS "Asset_Key_ID (WB Sys Users)",
T271_workbook_owner.auth_user_id AS "Auth_User_ID (WB Sys Users)",
T271_workbook_owner.created_at AS "Created_At (WB Sys Users)",
T271_workbook_owner.custom_display_name AS "Custom_Display_Name (WB Sys Users)",
T271_workbook_owner.deleted_at AS "Deleted_At (WB Sys Users)",
T271_workbook_owner.domain_id AS "Domain_ID (WB Sys Users)",
T271_workbook_owner.email AS "Email (Sys Users)",
T271_workbook_owner.friendly_name AS "Friendly_Name (WB Sys Users)",
T271_workbook_owner.hashed_password AS "Hashed_Password (WB Sys Users)",
T271_workbook_owner.id AS "Id (WB Sys Users)",
T271_workbook_owner.keychain AS "Keychain (WB Sys Users)",
T271_workbook_owner.lock_version AS "Lock_Version (WB Sys Users)",
T271_workbook_owner.name AS "Name (WB Sys Users)",
T271_workbook_owner.salt AS "Salt (WB Sys Users)",
T271_workbook_owner.state AS "State (WB Sys Users)",
T271_workbook_owner.sys AS "Sys (WB Sys Users)",
T271_workbook_owner.updated_at AS "Updated_At (WB Sys Users)",
T271_datasource_owner.activated_at AS "Activated_At (DS Sys Users)",
T271_datasource_owner.activation_code AS "Activation_Code (DS Sys Users)",
T271_datasource_owner.admin_level AS "Admin_Level (DS Sys Users)",
T271_datasource_owner.asset_key_id AS "Asset_Key_ID (DS Sys Users)",
T271_datasource_owner.auth_user_id AS "Auth_User_ID (DS Sys Users)",
T271_datasource_owner.created_at AS "Created_At (DS Sys Users)",
T271_datasource_owner.custom_display_name AS "Custom_Display_Name (DS Sys Users)",
T271_datasource_owner.deleted_at AS "Deleted_At (DS Sys Users)",
T271_datasource_owner.domain_id AS "Domain_ID (DS Sys Users)",
T271_datasource_owner.email AS "Email (DS Sys Users)",
T271_datasource_owner.friendly_name AS "Friendly_Name (DS Sys Users)",
T271_datasource_owner.hashed_password AS "Hashed_Password (DS Sys Users)",
T271_datasource_owner.id AS "Id (DS Sys Users)",
T271_datasource_owner.keychain AS "Keychain (DS Sys Users)",
T271_datasource_owner.lock_version AS "Lock_Version (DS Sys Users)",
T271_datasource_owner.name AS "Name (DS Sys Users)",
T271_datasource_owner.salt AS "Salt (DS Sys Users)",
T271_datasource_owner.state AS "State (DS Sys Users)",
T271_datasource_owner.sys AS "Sys (DS Sys Users)",
T271_datasource_owner.updated_at AS "Updated_At (DS Sys Users)",
T297.caption AS "Caption (Views)",
T297.created_at AS "Created_At (Views)",
T297.datasource_id AS "Datasource_ID (Views)",
T297.description AS "Description (Views)",
T297.edit_count AS "Edit_Count (Views)",
T297.fields AS "Fields (Views)",
T297.first_published_at AS "First_Published_At (Views)",
T297.for_cache_updated_at AS "For_Cache_Updated_At (Views)",
T297.id AS "Id (Views)",
T297.index AS "Index (Views)",
T297.locked AS "Locked (Views)",
T297.luid AS "Luid (Views)",
T297.name AS "Name (Views)",
T297.owner_id AS "Owner_ID (Views)",
T297.published AS "Published (Views)",
T297.read_count AS "Read_Count (Views)",
T297.repository_data_id AS "Repository_Data_ID (Views)",
T297.repository_url AS "Repository_Url (Views)",
REPLACE(T297.repository_url,'/sheets','') AS "Cuurentsheet  (Views)",
T297.revision AS "Revision (Views)",
T297.sheet_id AS "Sheet_ID (Views)",
T297.sheettype AS "Sheettype (Views)",
T297.site_id AS "Site_ID (Views)",
T297.state AS "State (Views)",
T297.thumbnail_id AS "Thumbnail_ID (Views)",
T297.title AS "Title (Views)",
T297.updated_at AS "Updated_At (Views)",
T297.workbook_id AS "Workbook_ID (Views)",
T97.action AS "Action (Usage)",
T97.completed_at AS "Completed_At (Usage)",
T97.controller AS "Controller (Usage)",
T97.created_at AS "Created_At (Usage)",
T97.currentsheet AS "Currentsheet (Usage)",
T97.http_referer AS "Http_Referer (Usage)",
T97.http_request_uri AS "Http_Request_Uri (Usage)",
T97.http_user_agent AS "Http_User_Agent (Usage)",
T97.id AS "Id (Usage)",
T97.port AS "Port (Usage)",
T97.remote_ip AS "Remote_Ip (Usage)",
T97.session_id AS "Session_ID (Usage)",
T97.site_id AS "Site_ID (Usage)",
T97.status AS "Status (Usage)",
T97.user_cookie AS "User_Cookie (Usage)",
T97.user_id AS "User_ID (Usage)",
T97.user_ip AS "User_Ip (Usage)",
T97.vizql_session AS "Vizql_Session (Usage)",
T97.worker AS "Worker (Usage)",
T290_usage.created_at AS "Created_At (Users Usage)",
T290_usage.extracts_required AS "Extracts_Required (Users Usage)",
T290_usage.id AS "Id (Users Usage)",
T290_usage.lock_version AS "Lock_Version (Users Usage)",
T290_usage.login_at AS "Login_At (Users Usage)",
T290_usage.luid AS "Luid (Users Usage)",
T290_usage.nonce AS "Nonce (Users Usage)",
T290_usage.raw_data_suppressor_tristate AS "Raw_Data_Suppressor_Tristate (Users Usage)",
T290_usage.row_limit AS "Row_Limit (Users Usage)",
T290_usage.site_id AS "Site_ID (Users Usage)",
T290_usage.site_role_id AS "Site_Role_ID (Users Usage)",
T290_usage.storage_limit AS "Storage_Limit (Users Usage)",
T290_usage.system_admin_auto AS "System_Admin_Auto (Users Usage)",
T290_usage.system_user_id AS "System_User_ID (Users Usage)",
T290_usage.updated_at AS "Updated_At (Users Usage)",
T271_usage.activated_at AS "Activated_At (Sys Users Usage)",
T271_usage.activation_code AS "Activation_Code (Sys Users Usage)",
T271_usage.admin_level AS "Admin_Level (Sys Users Usage)",
T271_usage.asset_key_id AS "Asset_Key_ID (Sys Users Usage)",
T271_usage.auth_user_id AS "Auth_User_ID (Sys Users Usage)",
T271_usage.created_at AS "Created_At (Sys Users Usage)",
T271_usage.custom_display_name AS "Custom_Display_Name (Sys Users Usage)",
T271_usage.deleted_at AS "Deleted_At (Sys Users Usage)",
T271_usage.domain_id AS "Domain_ID (Sys Users Usage)",
T271_usage.email AS "Email (Sys Users Usage)",
T271_usage.friendly_name AS "Friendly_Name (Sys Users Usage)",
T271_usage.hashed_password AS "Hashed_Password (Sys Users Usage)",
T271_usage.id AS "Id (Sys Users Usage)",
T271_usage.keychain AS "Keychain (Sys Users Usage)",
T271_usage.lock_version AS "Lock_Version (Sys Users Usage)",
T271_usage.name AS "Name (Sys Users Usage)",
T271_usage.salt AS "Salt (Sys Users Usage)",
T271_usage.seat_licensing_role_id AS "Seat_Licensing_Role_ID (Sys Users Usage)",
T271_usage.state AS "State (Sys Users Usage)",
T271_usage.subscription_licensing_role_id AS "Subscription_Licensing_Role_ID (Sys Users Usage)",
T271_usage.sys AS "Sys (Sys Users Usage)",
T271_usage.updated_at AS "Updated_At (Sys Users Usage)"
FROM
datasources T55
-- <--- BEGIN OPTIONAL ALL DATASOURCES JOINS --->
LEFT JOIN (SELECT datasource_id, has_extract, id FROM data_connections GROUP BY datasource_id, has_extract, id) as T49_dc ON T55.id = T49_dc.datasource_id -- Obtains Extract information on first level Datasources (T49_dc = embedded data connections)
LEFT JOIN data_connections T55_dc ON T55.id = T55_dc.datasource_id AND T55_dc.dbclass = 'sqlproxy' -- Obtains information on Datasources used by a Workbook where they connect to Published Datasources
LEFT JOIN datasources T55_ds ON T55_dc.dbname = T55_ds.repository_url AND T55_ds.connectable = true -- Published Connectable Datasources for additional info

LEFT JOIN (
SELECT MIN(dc.id) AS "data_connection_id", CAST('Data Source' AS TEXT) AS "item_type", dc.datasource_id
FROM data_connections AS dc
INNER JOIN datasources AS dc_d ON dc.datasource_id = dc_d.id AND dc_d.connectable = true
GROUP BY dc.datasource_id
) as T55_url ON T55_url.datasource_id = (CASE T55_dc.dbclass WHEN 'sqlproxy' THEN T55_ds.id ELSE T55.id END) -- Used to get the URL of the Extract

-- <---  END OPTIONAL ALL DATASOURCES JOINS --->
LEFT JOIN workbooks T301 ON T301.id = T55.parent_workbook_id
LEFT JOIN users T290_workbook_owner ON T301.owner_id = T290_workbook_owner.id
LEFT JOIN system_users T271_workbook_owner ON T271_workbook_owner.id = T290_workbook_owner.system_user_id
INNER JOIN projects T227 ON T227.id = T55.project_id
INNER JOIN users T290_datasource_owner ON T55.owner_id = T290_datasource_owner.id
LEFT JOIN system_users T271_datasource_owner ON T271_datasource_owner.id = T290_datasource_owner.system_user_id
INNER JOIN views T297 ON T297.workbook_id = T301.id
LEFT JOIN http_requests T97 ON T97.currentsheet = REPLACE(T297.repository_url,'/sheets','')
INNER JOIN users T290_usage ON T97.user_id = T290_usage.id
INNER JOIN system_users T271_usage ON T271_usage.id = T290_usage.system_user_id