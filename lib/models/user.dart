class Users {
  final firstname, name, email, city;

  Users(
      {this.firstname,
      this.name,
      this.email,
      this.city});

  fromJson(data) {
    return Users(
      firstname: data['firstname'],
      name: data['name'],
      email: data['eamil'],
      city: data['city'],
    );
  }
}