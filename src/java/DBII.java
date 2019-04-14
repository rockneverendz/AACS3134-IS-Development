
import entity.Category;
import entity.Meal;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import javax.imageio.ImageIO;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 * Database Image Initializer
 *
 * @author Verniy
 */
public class DBII {

    EntityManager em;

    public static void main(String[] args) throws IOException {

        // Get current working directory
        String projectRoot = System.getProperty("user.dir");

        String[] categoryImages = {
            "/structure/CategoryImages/nasi lemak kukus popular.jpg",
            "/structure/CategoryImages/ramen.jpg",
            "/structure/CategoryImages/hainanese-chicken-83.jpg",
            "/structure/CategoryImages/indomee.jpg",
            "/structure/CategoryImages/veg.jpg",
            "/structure/CategoryImages/fresh_code.jpg"
        };

        String[] foodImages = {
            // Chicken Rice
            "/structure/FoodImages/ChickenRice/RoastedChickenRice.jpg",
            "/structure/FoodImages/ChickenRice/DrumstickChickenRice.jpg",
            "/structure/FoodImages/ChickenRice/KampungChickenRice.jpg",
            "/structure/FoodImages/ChickenRice/SmokedDuckRice.jpg",
            "/structure/FoodImages/ChickenRice/ChickenChopRice.jpg",
            "/structure/FoodImages/ChickenRice/SteamChickenRice.jpg",
            // Masakan Malaysia
            "/structure/FoodImages/MasakanMalaysia/nasi-lemak.jpg",
            "/structure/FoodImages/MasakanMalaysia/NasiLemakRendang.jpg",
            "/structure/FoodImages/MasakanMalaysia/NasiGorengKampung.jpg",
            "/structure/FoodImages/MasakanMalaysia/KuetiaoGoreng.jpg",
            "/structure/FoodImages/MasakanMalaysia/nasi-goreng-pattaya.jpg",
            "/structure/FoodImages/MasakanMalaysia/MeeGoreng.jpg",
            // Noodle
            "/structure/FoodImages/Noodles/fishballnoodlesoup.jpg",
            "/structure/FoodImages/Noodles/MushroomRamen.jpg",
            "/structure/FoodImages/Noodles/SmokedDuckRamen.jpg",
            "/structure/FoodImages/Noodles/HakkaRamen.jpg",
            "/structure/FoodImages/Noodles/CheeseSpaghetti.jpg",
            "/structure/FoodImages/Noodles/PenangLaksa.jpg",
            // Indomee
            "/structure/FoodImages/IndoDeli/Indomee.jpg",
            "/structure/FoodImages/IndoDeli/IndomeeSpicy.jpg",
            "/structure/FoodImages/IndoDeli/SaltedIndoMie.jpg",
            "/structure/FoodImages/IndoDeli/IndomieWithChicken.jpg",
            "/structure/FoodImages/IndoDeli/IndoMieFish.jpg",
            "/structure/FoodImages/IndoDeli/IndoMieSeafood.jpg",
            // Vegetarian cuisine
            "/structure/FoodImages/Veggie/CurryVegetable.jpg",
            "/structure/FoodImages/Veggie/SpicySweetPotatoCurry.jpg",
            "/structure/FoodImages/Veggie/SauteedGingerSoyChicken.jpg",
            "/structure/FoodImages/Veggie/SpicyMonogolianDelight.jpg",
            "/structure/FoodImages/Veggie/SpicySzechuanPineappleBeef.jpg",
            "/structure/FoodImages/Veggie/PineappleSeaweedSoyFish.jpg",
            // Fresh Code
            "/structure/FoodImages/FreshCode/Carrot.jpg",
            "/structure/FoodImages/FreshCode/lycheejuice.jpg",
            "/structure/FoodImages/FreshCode/pineappleJuice.jpg",
            "/structure/FoodImages/FreshCode/Passion-Fruit-Juice.jpg",
            "/structure/FoodImages/FreshCode/mango-juice.jpg",
            "/structure/FoodImages/FreshCode/watermelonJuice.jpg"
        };

        DBII dbii = new DBII();

        for (int i = 0;
                i < foodImages.length;
                i++) {

            // Construct path
            File file = new File(projectRoot + foodImages[i]);
            System.out.println(file);

            // Get image from path
            BufferedImage bImage = ImageIO.read(file);
            ByteArrayOutputStream bos = new ByteArrayOutputStream();
            ImageIO.write(bImage, "jpg", bos);
            byte[] data = bos.toByteArray();

            if (data != null) {
                // Update
                dbii.updateMealImage(i + 1, data);
            } else {
                System.out.println("Null detected");
            }
        }

        for (int i = 0;
                i < categoryImages.length;
                i++) {

            // Construct path
            File file = new File(projectRoot + categoryImages[i]);
            System.out.println(file);

            // Get image from path
            BufferedImage bImage = ImageIO.read(file);
            ByteArrayOutputStream bos = new ByteArrayOutputStream();
            ImageIO.write(bImage, "jpg", bos);
            byte[] data = bos.toByteArray();

            if (data != null) {
                // Update
                dbii.updateCategoryImage(i + 1, data);
            } else {
                System.out.println("Null detected");
            }
        }
    }

    private DBII() {
        EntityManagerFactory emfactory = Persistence.createEntityManagerFactory("AACS3134-IS-DevelopmentPU");
        em = emfactory.createEntityManager();

    }

    private void updateMealImage(int id, byte[] image) {
        Meal oldMeal = (Meal) em.find(Meal.class,
                id);
        em.getTransaction().begin();
        oldMeal.setImage(image);
        em.getTransaction().commit();

    }

    private void updateCategoryImage(int id, byte[] image) {
        Category category = (Category) em.find(Category.class,
                id);
        em.getTransaction().begin();
        category.setImage(image);
        em.getTransaction().commit();
    }
}
