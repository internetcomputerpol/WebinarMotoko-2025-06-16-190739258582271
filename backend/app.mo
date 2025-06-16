import Int8 "mo:base/Int8";
import HashMap "mo:base/HashMap";
import Text "mo:base/Text";
import Iter "mo:base/Iter";


actor HelloWorld {
  
  var greeting : Text = "Hello, ";
  public func setGreeting(prefix : Text) : async () {
    greeting := prefix;
  };
  public query func greet(name : Text) : async Text {
    return greeting # name # "!";
  };

   public type Room = 
   {
   name : Text;
   temperature : Int8;
   humidity: Int8;
   oxygen:Int8;
   radiation:Float;

   };

   var rooms = HashMap.HashMap<Text,Room>(8,Text.equal,Text.hash);

   private func initializeRooms() 
   {
    if (rooms.size() == 0)
    {

      rooms.put("kajuta_a", { name = "Kajuta A"; temperature = 22; humidity = 45; oxygen = 21; radiation = 0.1  });

      rooms.put("kajuta_b", { name = "Kajuta B"; temperature = 22; humidity = 45; oxygen = 21; radiation = 0.1  });
      rooms.put("kajuta_c", { name = "Kajuta C"; temperature = 22; humidity = 45; oxygen = 21; radiation = 0.1  });
      rooms.put("oficerka", { name = "Oficerka"; temperature = 22; humidity = 45; oxygen = 21; radiation = 0.1  });
      rooms.put("reaktor", { name = "Reaktor"; temperature = 22; humidity = 45; oxygen = 21; radiation = 0.1  });
      rooms.put("panel_techniczny", { name = "Panel Techniczny"; temperature = 22; humidity = 45; oxygen = 21; radiation = 0.1  });
      rooms.put("naped", { name = "Naped"; temperature = 22; humidity = 45; oxygen = 21; radiation = 0.1  });
      rooms.put("disgnostyka", { name ="Diadstyka"; temperature = 22; humidity = 45; oxygen = 21; radiation = 0.1  });
    };
   };

   //WYWOLANIE
   initializeRooms();
  

   public func  getAllRooms() : async [(Text,Room)]
   {
    Iter.toArray(rooms.entries());
   };

public query func getRoom(id:Text) : async ?Room 
{
  rooms.get(id);
};

public func udateRoom(id:Text, room: Room) : async Bool
{
switch(rooms.get(id))
{
  case null { false };
  case (? _) { rooms.put(id,room); true}
};
};



public func updateTemperature(id: Text, temperature: Int8) : async Bool {
  switch (rooms.get(id)) {
    case (?room) {
      let updatedRoom = {
        name = room.name;
        temperature = temperature;
        humidity = room.humidity;
        oxygen = room.oxygen;
        radiation = room.radiation;
      };
      rooms.put(id, updatedRoom);
      true;
    };
    case null {
      false;
    };
  }
};





}









