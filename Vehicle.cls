public abstract class Vehicle {

    public enum Medium {
        LAND,
        AIR,
        WATER
    }

    //variables
    private Decimal speed;
    private String name;
    private Integer occupants;
    private static final Integer capacity = 1;
    private List<Medium> media;

    //constructor
    public Vehicle() {
        this.name = 'My car';
        this.speed = 0;
        this.occupants = 1;
        this.media = new List<Medium>();
    }

    public Vehicle(String name, Decimal speed, Integer occupants, List<Medium> media) {
        this.name = name;
        this.speed = speed < 0 ? 0 : speed; // Ensure speed is not negative
        this.occupants = occupants < 0 ? 0 : occupants; // Ensure occupants is not negative
        this.media = media;
    }
    //getters and setters
    public Decimal getSpeed() {
        return speed;
    }

    public String getName() {
        return name;
    }

    public Integer getOccupants() {
        return occupants;
    }

    public void setOccupants(Integer occupants) {
        if (occupants >= 0) {
            this.occupants = occupants;
        } else {
            throw new IllegalArgumentException('Occupants cannot be negative.');
        }
    }

    public Integer getCapacity() {
        return capacity;
    }

    protected List<Medium> getMedia() {
        return media;
    }

    protected void setMedia(List<Medium> media) {
        this.media = media;
    }

    //Accelerate
    public void Accelerate(Decimal amount) {
        this.speed = this.speed + amount;
        if (this.speed < 0) {
            this.speed = 0;
        }
    }

    //Turn
    public abstract void Turn(Integer degrees);

    //ToString
    public override String ToString() {
        List<String> mediaStrings = new List<String>();
        for (Medium medium : media) {
            mediaStrings.add(String.valueOf(medium));
        }
        return 'Name: ' + name + 
               ', Speed: ' + speed + 
               ', Occupants: ' + occupants + 
               ', Capacity: ' + capacity + 
               ', Media: ' + String.join(mediaStrings, ', ');
    }
}
