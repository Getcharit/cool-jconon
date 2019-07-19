<div class="container">
  <div class="container-fluid">
    <div class="row-fluid row-content">
      <div class="span7">
        <p>${message('label.selezione.concorsi')}</p>
        <p><strong>${message('label.selezione.altri')}</strong></p>
        <p>${message('label.candidatiCNR')} <a href="https://utenti.cnr.it">https://utenti.cnr.it</a></p>
      </div>
      <div class="span5">
        <form class="form-signin" action="${url.context}/rest/security/login" method="post">
          <legend>${message('sign.in')}</legend>
          <fieldset>
            <div class="control-group">
              <div class="controls">
                <input type="text" id="username" name="username" autocomplete="username" placeholder="${message('label.account.userName')}" class="span12">
              </div>
            </div>
            <div class="control-group">
              <div class="controls">
                <input  type="password" id="password" name="password" autocomplete="current-password" placeholder="${message('label.account.password')}" class="span12">
              </div>
            </div>
            <div class="inline-block btn-block">
                <#if spidEnable>
                    <button class="btn btn-primary span6" type="submit"><i class="icon-user animated flash"></i> ${message('sign.in')}</button>
                     <!-- AGID - SPID IDP BUTTON SMALL "ENTRA CON SPID" * begin * -->
                    <a href="#" class="btn btn-primary italia-it-button italia-it-button-size-s button-spid span6" spid-idp-button="#spid-idp-button-small-get" aria-haspopup="true" aria-expanded="false">
                        <span class="italia-it-button-icon"><img src="res/img/spid-ico-circle-bb.svg" onerror="this.src='res/img/spid-ico-circle-bb.png'; this.onerror=null;" alt="" /></span>
                        <span class="italia-it-button-text">Entra con SPID</span>
                    </a>
                    <div id="spid-idp-button-small-get" class="spid-idp-button spid-idp-button-tip spid-idp-button-relative">
                        <ul id="spid-idp-list-small-root-get" class="spid-idp-button-menu" aria-labelledby="spid-idp">
                            <#list idp?keys as key>
                                <li class="spid-idp-button-link" data-idp="${key}">
                                    <a href="${url.context}/spid-idp?key=${key}"><span class="spid-sr-only">${idp[key].name}</span><img src="${idp[key].imageUrl}" alt="${idp[key].name}"/></a>
                                </li>
                            </#list>
                            <li class="spid-idp-support-link">
                                <a href="https://www.spid.gov.it">Maggiori informazioni</a>
                            </li>
                            <li class="spid-idp-support-link">
                                <a href="https://www.spid.gov.it/richiedi-spid">Non hai SPID?</a>
                            </li>
                            <li class="spid-idp-support-link">
                                <a href="https://www.spid.gov.it/serve-aiuto">Serve aiuto?</a>
                            </li>
                        </ul>
                    </div>
                <#else>
                    <button class="btn btn-primary span12" type="submit"><i class="icon-user animated flash"></i> ${message('sign.in')}</button>
                </#if>
            </div>
            <button id="passwordRecovery" class="btn btn-block" type="button"><i class="icon-envelope animated flash icon-blue"></i> <span class="text-info">${message('password.recovery')}</span></button>
            <#if args.failure??>
              <label for="password" class="error label label-important">${message('message.incorrect')}</label>
            </#if>
            <input type="hidden" name="redirect" value="${url.context}/<#if args.redirect??>${args.redirect}<#else>home</#if>"/>
            <#if queryString??>
              <input type="hidden" name="queryString" value="${queryString}"/>
            </#if>  
            <input type="hidden" name="failure" value="${url.context}/${page.id}?failure=yes"/>
            <div>
              <small class="muted">${message('label.forgot.password.mail')}</small>
            </div>
          </fieldset>
        </form>
      </div>
    </div>
  </div>
</div> <!-- /container -->