import 'destination.dart';
import 'city.dart';

class DestinationsRepository {
  static List<Destination> load() {
    const allDestinations = <Destination>[
      Destination(
        title: 'Europe',
        imageURL: 'https://skitterphoto.com/photos/skitterphoto-2862-default.jpg',
        cities: <City> [
          City(
            id: 1,
            title: 'London',
            imageURL: 'https://cdn.pixabay.com/photo/2014/09/11/18/23/london-441853_960_720.jpg',
            description: 'London is the capital and most populous city of England and the UK. Standing on the River Thames in the southeast of ths island of Great Britian, London has been a major settlement for two millenia.',
          ),
          City(
            id: 2,
            title: 'Madrid',
            imageURL: 'http://peika.bg/pictures/25999_650__3.jpg',
          ),
          City(
            id: 3,
            title: 'Paris',
            imageURL: 'https://c1.staticflickr.com/9/8375/8561192234_7c8268f298_b.jpg',
          ),
          City(
            id: 4,
            title: 'Rome',
            imageURL: 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Colosseum_in_Rome%2C_Italy_-_April_2007.jpg/1024px-Colosseum_in_Rome%2C_Italy_-_April_2007.jpg',
          ),
        ],
      ),
      Destination(
        title: 'USA',
        imageURL: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ70Ja2AfGfqal-SFxwfvX2qnmpPHKZt2vD9b4lzHWAFHk4bAi4Ew',
        cities: <City> [
          City(
            id: 100,
            title: 'Chicago',
            imageURL: 'https://c1.staticflickr.com/9/8812/28131423133_51991e7efb_b.jpg',
          ),
          City(
            id: 101,
            title: 'Los Angeles',
            imageURL: 'https://c1.staticflickr.com/1/443/31361221254_d48efd35a2_b.jpg',
          ),
          City(
            id: 102,
            title: 'Miami',
            imageURL: 'https://c1.staticflickr.com/4/3548/3442230489_6667c60e33_b.jpg',
          ),
          City(
            id: 103,
            title: 'Seattle',
            imageURL: 'https://cdn.pixabay.com/photo/2017/08/07/23/16/seattle-2609031_960_720.jpg',
          ),
          City(
            id: 104,
            title: 'New York',
            imageURL: 'https://c1.staticflickr.com/8/7665/17178926219_27840468b0_b.jpg',
          ),
        ],
      ),
      Destination(
        title: 'Asia',
        imageURL: 'https://previews.123rf.com/images/hecke/hecke1411/hecke141100471/33720677-la-grande-muraille-de-chine-pr%C3%A8s-de-jinshanling.jpg',
        cities: <City> [
          City(
            id: 200,
            title: 'Bangkok',
            imageURL: 'https://c1.staticflickr.com/7/6060/6328056994_c434b95d1e_b.jpg',
          ),
          City(
            id: 201,
            title: 'Hong Kong',
            imageURL: 'https://c1.staticflickr.com/5/4762/39044589704_1380d6acdc_b.jpg',
          ),
          City(
            id: 202,
            title: 'Tokyo',
            imageURL: 'https://ggbmagazine.com/wp-content/uploads/2017/11/japan2.jpg',
          ),
        ],
      ),
    ];

    return allDestinations;
  }
}
