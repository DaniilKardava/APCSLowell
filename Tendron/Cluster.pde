public class Cluster
{
    public final static int NUM_STEMS = 15; //number of tendrils per cluster

    public Cluster(int segments, int x, int y)
    {
       if (segments > 2) {
         for (int i = 0; i < NUM_STEMS; i++) {
           double randAngle = Math.random() * 2 * 3.1415;
           Tendril tendril = new Tendril(segments, randAngle, x, y);
           tendril.show();
         }
         
       }
    }
}
