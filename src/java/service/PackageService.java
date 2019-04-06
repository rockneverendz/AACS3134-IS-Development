package service;

import entity.Customer;
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
            ArrayList<Packageist> arrayList,
            Customer customer
    ) throws RollbackException {
        em.getTransaction().begin();
        em.persist(packagemeal);
        em.getTransaction().commit();

        arrayList.stream().map((packageist) -> {
            packageist.setPackage1(packagemeal);
            return packageist;
        }).forEachOrdered((packageist) -> {
            packageist.setPackageistPK(new PackageistPK(
                    packageist.getMeal().getMealId(),
                    packagemeal.getPackageId()
            ));
        });

        em.getTransaction().begin();
        packagemeal.setPackageistList(arrayList);
        em.getTransaction().commit();
    }

    public Package findPackageByID(int id) {
        return (Package) em.find(Package.class, id);
    }

    public boolean updatePackage(Package newPackage, ArrayList<Packageist> arrayList) throws RollbackException {
        Package oldPackage = findPackageByID(newPackage.getPackageId());
        if (oldPackage != null) {

            arrayList.stream().map((packageist) -> {
                packageist.setPackage1(newPackage);
                return packageist;
            }).forEachOrdered((packageist) -> {
                packageist.setPackageistPK(
                        new PackageistPK(
                                oldPackage.getPackageId(),
                                packageist.getPackage1().getPackageId()
                        )
                );
            });

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

    public List<Package> findAll() {
        List packageList = em.createNamedQuery("Package.findAll").getResultList();
        return packageList;
    }

    public void close() {
        this.em.close();
    }
}
