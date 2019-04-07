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
            ArrayList<Packageist> arrayList
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
            
            arrayList.stream().map((packageist) -> {
                packageist.setPackage1(newPackage);
                return packageist;
            }).forEachOrdered((packageist) -> {
                packageist.setPackageistPK(
                        new PackageistPK(
                                packageist.getMeal().getMealId(),
                                oldPackage.getPackageId()
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

    public boolean deletePackageList(Package newPackage, ArrayList<Packageist> arrayList) throws RollbackException {
        Package oldPackage = findPackageByID(newPackage.getPackageId());
        if (oldPackage != null) {
            //Still In Progress
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
