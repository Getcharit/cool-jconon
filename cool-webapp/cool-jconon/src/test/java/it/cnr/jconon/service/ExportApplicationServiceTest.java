package it.cnr.jconon.service;

import it.cnr.cool.cmis.service.CMISService;
import it.cnr.cool.service.frontOffice.FrontOfficeService;
import it.cnr.cool.web.scripts.exception.ClientMessageException;
import it.cnr.jconon.cmis.model.JCONONFolderType;
import it.cnr.jconon.cmis.model.JCONONPropertyIds;
import it.cnr.jconon.service.application.ExportApplicationsService;
import it.spasia.opencmis.criteria.Criteria;
import it.spasia.opencmis.criteria.CriteriaFactory;
import it.spasia.opencmis.criteria.restrictions.Restrictions;
import org.apache.chemistry.opencmis.client.api.ItemIterable;
import org.apache.chemistry.opencmis.client.api.OperationContext;
import org.apache.chemistry.opencmis.client.api.QueryResult;
import org.apache.chemistry.opencmis.client.api.Session;
import org.apache.chemistry.opencmis.client.bindings.spi.BindingSession;
import org.apache.chemistry.opencmis.client.runtime.ObjectIdImpl;
import org.apache.chemistry.opencmis.commons.PropertyIds;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static junit.framework.TestCase.assertTrue;

/**
 * Created by cirone on 29/01/2015.
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:/META-INF/cool-jconon-test-context.xml"})
@DirtiesContext(classMode = DirtiesContext.ClassMode.AFTER_CLASS)
public class ExportApplicationServiceTest {

    @Autowired
    ExportApplicationsService exportApplicationsService;
    @Autowired
    CMISService cmisService;
    @Autowired
    private OperationContext cmisDefaultOperationContext;
    private String finalZipNodeRef;
    private Session adminSession;
    private String nodeRefbando;


    @Before
    public void createModel() {
        adminSession = cmisService.createAdminSession();
        Criteria criteria = CriteriaFactory.createCriteria(JCONONFolderType.JCONON_CALL.queryName());

        criteria.add(Restrictions.le(JCONONPropertyIds.CALL_DATA_FINE_INVIO_DOMANDE.value(), FrontOfficeService.getNowUTC()));
        ItemIterable<QueryResult> queryResult = criteria.executeQuery(
                adminSession, false, cmisDefaultOperationContext);
        nodeRefbando = ((QueryResult) queryResult.iterator().next()).getPropertyValueById(PropertyIds.OBJECT_ID);
    }

    @After
    public void deleteZip() {
//        se il test non crea lo zip (es: exportApplicationsServiceTestUnautorized) finalZipNodeRef è null
        if (finalZipNodeRef != null) {
//        cancello il file zip creato
            adminSession.delete(new ObjectIdImpl(finalZipNodeRef));
        }
    }


    @Test
    public void exportApplicationsServiceTest() {
        BindingSession bindingSession = cmisService.getAdminSession();
        finalZipNodeRef = exportApplicationsService.exportApplications(adminSession, bindingSession, "workspace://SpacesStore/" + nodeRefbando.split(";")[0]);

        assertTrue(finalZipNodeRef != null);
    }


    @Test(expected = ClientMessageException.class)
    public void exportApplicationsServiceTestUnautorized() {
        BindingSession bindingSession = cmisService.createBindingSession("jconon", "jcononpw");

        finalZipNodeRef = exportApplicationsService.exportApplications(adminSession, bindingSession, "workspace://SpacesStore/" + nodeRefbando.split(";")[0]);
    }

}
