<html>
<body>
<div style="font-size: 11pt">Access credentials for ${account.fullName}</div>
<hr/>
<p>Username: ${account.userName}</p>
<hr/>
<p>The send you the activation link that will allow users to access the procedure of online recruitment for National Research Council of Italy</p>
<p><a href="${url}/rest/security/confirm-account?userid=${account.userName}&pin=${account.pin}">Enabling account</a>.</p>
<p>If the link does not work copy the text below into the address bar of your browser.</p>
<p>${url}/rest/security/confirm-account?userid=${account.userName}&pin=${account.pin}</p>
<br/>
<p>Clicking on the link will be confirmed and enabled its users to access the procedure from the following address:</p>
<p><a href="${url}/login">${url}/login</a></p>
<p>For requests for information or assistance, please send a report using the <a href="${url}/helpdesk">helpdesk</a> section of the site.</p>
<hr/>
<p>This message was generated by an automatic system.</p>
<p>Please do not answer.</p>
</body>
</html>