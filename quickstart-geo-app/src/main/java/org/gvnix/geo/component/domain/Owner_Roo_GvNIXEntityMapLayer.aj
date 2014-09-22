// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.gvnix.geo.component.domain;

import java.util.List;
import javax.persistence.TypedQuery;
import org.gvnix.geo.component.domain.Owner;

privileged aspect Owner_Roo_GvNIXEntityMapLayer {
    
    public static List<Owner> Owner.findAllOwnersByBoundingBox(String bbox) {
        TypedQuery<Owner> q = entityManager().createQuery("SELECT o FROM Owner o WHERE  intersects(o.location, :bbox) = true OR  intersects(o.distance, :bbox) = true OR  intersects(o.area, :bbox) = true ", Owner.class);
        q.setParameter("bbox", String.format("POLYGON((%s))", bbox));
        return q.getResultList();
    }
    
}