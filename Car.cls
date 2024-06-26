public class Car extends Vehicle {

    //variables
    private Integer steeringRotation;
    private Integer tireRotation;
    private String gear;

    public Car(String name, Decimal speed, Integer occupants) {
        super(name, speed, occupants, new List<Vehicle.Medium>{Vehicle.Medium.LAND});
        this.steeringRotation = 0;
        this.tireRotation = 0;
        this.gear = 'P'; //Park
    }

    //getters and setters
    public Integer getTireRotation() {
        return tireRotation;
    }

    public String getGear() {
        return gear;
    }

    public override void Turn(Integer degrees) {
        this.steeringRotation += degrees;
        if (this.steeringRotation < -1440) {
            this.steeringRotation = -1440;
        } else if (this.steeringRotation > 1440) {
            this.steeringRotation = 1440;
        }

        this.tireRotation += degrees / 16;
        if (this.tireRotation < -90) {
            this.tireRotation = -90;
        } else if (this.tireRotation > 90) {
            this.tireRotation = 90;
        }
    }

    //ToString
    public String ToStringTwo() {
        return super.ToString() + 
               ', SteeringRotation: ' + steeringRotation + 
               ', TireRotation: ' + tireRotation + 
               ', Gear: ' + gear;
    }
}
