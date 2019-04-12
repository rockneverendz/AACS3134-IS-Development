package service;

import entity.Package;
import entity.Packageist;
import entity.PackageistPK;
import java.util.ArrayList;
import javax.persistence.*;
import java.util.List;

public class PackageService {

    EntityManager em;

    public PackageService() {
        EntityManagerFactory emfactory = Persistence.createEntityManagerFactory("AACS3134-IS-DevelopmentPU");
        this.em = emfactory.createEntityManager();
    }

    public void addMealpackage(
            Package packagemeal,
            ArrayList<Packageist> arrayList
    ) throws RollbackException {
        em.getTransaction().begin();
        em.persist(packagemeal);
        em.getTransaction().commit();

        for (int i = 0; i < arrayList.size(); i++) {
            Packageist packageist = arrayList.get(i);

            packageist.setPackage1(packagemeal);
            packageist.setPackageistPK(
                    new PackageistPK(packagemeal.getPackageId(), i)
            );
        }

        em.getTransaction().begin();
        packagemeal.setPackageistList(arrayList);
        em.getTransaction().commit();
    }

    public Package findPackageByID(int id) {
        return (Package) em.find(Package.class, id);
    }

    public List<Packageist> findPackageistByPackage(int packageId) {
        return (List<Packageist>) em.createNativeQuery("SELECT pl.* FROM PACKAGEIST pl"
                + " INNER JOIN MEAL m ON pl.MEAL_ID = m.MEAL_ID"
                + " WHERE pl.PACKAGE_ID = " + packageId
                + " ORDER BY pl.DAY_OF_WEEK",
                Packageist.class)
                .getResultList();
    }

    public boolean updatePackage(Package newPackage, ArrayList<Packageist> arrayList) throws RollbackException {
        Package oldPackage = findPackageByID(newPackage.getPackageId());
        if (oldPackage != null) {

            em.getTransaction().begin();
            // DO NOT USE FUNCTIONAL OPERATION
            for (Packageist packageist : oldPackage.getPackageistList()) {
                em.remove(packageist);
            }
            em.getTransaction().commit();

            em.getTransaction().begin();
            oldPackage.getPackageistList().forEach((packageist) -> {
                em.remove(packageist);
            });
            em.getTransaction().commit();

            for (int i = 0; i < arrayList.size(); i++) {
                Packageist packageist = arrayList.get(i);

                packageist.setPackage1(newPackage);
                packageist.setPackageistPK(
                        new PackageistPK(newPackage.getPackageId(), i)
                );
            }

            em.getTransaction().begin();
            oldPackage.setAvailability(newPackage.getAvailability());
            oldPackage.setDescription(newPackage.getDescription());
            oldPackage.setPackageTime(newPackage.getPackageTime());
            oldPackage.setPackageistList(arrayList);
            em.getTransaction().commit();
            return true;
        }
        return false;
    }

    public boolean deletePackageList(Package newPackage) throws RollbackException {
        Package oldPackage = findPackageByID(newPackage.getPackageId());
        if (oldPackage != null) {
            em.getTransaction().begin();
            // DO NOT USE FUNCTIONAL OPERATION
            for (Packageist packageist : oldPackage.getPackageistList()) {
                em.remove(packageist);
            }
            em.getTransaction().commit();

            em.getTransaction().begin();
            em.remove(oldPackage);
            em.getTransaction().commit();
            return true;
        }
        return false;
    }

    public List<Package> findAll() {
        List packageList = em.createNamedQuery("Package.findAll").getResultList();
        return packageList;
    }

    public void close() {
        this.em.close();
    }
}
