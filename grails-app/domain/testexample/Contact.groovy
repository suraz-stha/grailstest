package testexample

class Contact {
    String name;
    String address;
    String email;
    String phone;
    boolean gender;
    String age;
    String status;


    static constraints = {
        name(blank: false,unique: true)
        address(blank: false)
        email (email: true)
        phone()
        gender ()
        age(nullable: false,blank: false)
        status (blank: false,)

    }
}
