 
<h1>Edit your profile</h1>

{if $error != ''}
	<div class="error">{$error}</div>
{/if}

<br/><br/>

<form action="profileedit?action=submit" method="post">

<fieldset>
<legend>User Details</legend>
<table class="input">
	<tr><th width="100">Username:</th><td>{$user.username|escape:"htmlall"}</td></tr>
	<tr><th>Email:</th><td><input id="email" class="long" name="email" type="text" value="{$user.email|escape:"htmlall"}"></input></td></tr>
	<tr><th>Password:</th>
		<td>
			<input autocomplete="off" id="password" name="password" type="password" value=""></input>
			<div class="hint">Only enter your password if you want to change it.</div>
		</td>
	</tr>
	<tr><th>Confirm Password:</th><td><input autocomplete="off" id="confirmpassword" name="confirmpassword" type="password" value=""></input>
	</td></tr>
	<tr><th>Site Api/Rss Key:</th><td>{$user.rsstoken}<br/><a class="confirm_action" href="?action=newapikey">Generate</a></td></tr>
</table>
</fieldset>
<fieldset>
<legend>Site Preferences</legend>
<table class="input">
	<tr><th>View Movie Page:</th>
		<td>
			<input id="movieview" name="movieview" value="1" type="checkbox" {if $user.movieview=="1"}checked="checked"{/if}></input>
			<div class="hint">Browse movie covers. Only shows movies with known IMDB info.</div>
		</td>
	</tr>
	<tr><th>View Music Page:</th>
		<td>
			<input id="musicview" name="musicview" value="1" type="checkbox" {if $user.musicview=="1"}checked="checked"{/if}></input>
			<div class="hint">Browse music covers. Only shows music with known lookup info.</div>
		</td>
	</tr>
	<tr><th>View Console Page:</th>
		<td>
			<input id="consoleview" name="consoleview" value="1" type="checkbox" {if $user.consoleview=="1"}checked="checked"{/if}></input>
			<div class="hint">Browse console covers. Only shows games with known lookup info.</div>
		</td>
	</tr>
	<tr><th>View Book Page:</th>
		<td>
			<input id="bookview" name="bookview" value="1" type="checkbox" {if $user.bookview=="1"}checked="checked"{/if}></input>
			<div class="hint">Browse book covers. Only shows books with known lookup info.</div>
		</td>
	</tr>
	<tr><th>Excluded Categories:</th>
		<td>
			{html_options style="height:105px;" multiple=multiple name="exccat[]" options=$catlist selected=$userexccat}
			<div class="hint">Use Ctrl and click to exclude multiple categories.</div>
		</td>
	</tr>
</table>
</fieldset>

{if $page->site->sabintegrationtype == 2}
<fieldset>
<legend>SABnzbd Integration</legend>
<table class="input">
	<tr>
		<th width="100"><label for="saburl">SABnzbd Url:</label></th>
		<td>
			<input id="saburl" class="long" name="saburl" type="text" value="{$saburl_selected}" />
			<div class="hint">The url of the SAB installation, for example: http://localhost:8080/sabnzbd/</div>
		</td>
	</tr>
	
	<tr>
		<th><label for="sabapikey">SABnzbd Api Key:</label></th>
		<td>
			<input id="sabapikey" class="long" name="sabapikey" type="text" value="{$sabapikey_selected}" />
			<div class="hint">The api key of the SAB installation. Can be the full api key or the nzb api key (as of SAB 0.6)</div>
		</td>
	</tr>
	
	<tr>
		<th><label for="sabapikeytype">Api Key Type:</label></th>
		<td>
			{html_radios id="sabapikeytype" name='sabapikeytype' values=$sabapikeytype_ids output=$sabapikeytype_names selected=$sabapikeytype_selected separator='<br />'}
			<div class="hint">Select the type of api key you entered in the above setting. Using your full SAB api key will allow you access to the SAB queue from within this site.</div>
		</td>
	</tr>
	
	<tr>
		<th><label for="sabpriority">Priority Level:</label></th>
		<td>
			{html_options id="sabpriority" name='sabpriority' values=$sabpriority_ids output=$sabpriority_names selected=$sabpriority_selected}
			<div class="hint">Set the priority level for NZBs that are added to your queue</div>
		</td>
	</tr>
	<tr>
		<th><label for="sabsetting">Setting Storage:</label></th>
		<td>
			{html_radios id="sabsetting" name='sabsetting' values=$sabsetting_ids output=$sabsetting_names selected=$sabsetting_selected separator='&nbsp;&nbsp;'}{if $sabsetting_selected == 2}&nbsp;&nbsp;[<a class="confirm_action" href="?action=clearcookies">Clear Cookies</a>]{/if}
			<div class="hint">Where to store the SAB setting.<br />&bull; <b>Cookie</b> will store the setting in your browsers coookies and will only work when using your current browser.<br/>&bull; <b>Site</b> will store the setting in your user account enabling it to work no matter where you are logged in from.<br /><span class="warning"><b>Please Note:</b></span> You should only store your full SAB api key with sites you trust.</div>
		</td>
	</tr>
</table>
</fieldset>
{/if}
<input type="submit" value="Save Profile" />
</form>
