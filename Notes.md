Your models must:

X Include at least one has_many, at least one belongs_to, and at least two has_many :through relationships

X Include a many-to-many relationship implemented with has_many :through associations. The join table must include a user-submittable attribute — that is to say, some attribute other than its foreign keys that can be submitted by the app's user

_ Your models must include reasonable validations for the simple attributes. You don't need to add every possible validation or duplicates, such as presence and a minimum length, but the models should defend against invalid data.

X You must include at least one class level ActiveRecord scope method. a. Your scope method must be chainable, meaning that you must use ActiveRecord Query methods within it (such as .where and .order) rather than native ruby methods (such as #find_all or #sort).

_ Your application must provide standard user authentication, including signup, login, logout, and passwords.

_ Your authentication system must also allow login from some other service. Facebook, Twitter, Foursquare, Github, etc...

X You must include and make use of a nested resource with the appropriate RESTful URLs.

X You must include a nested new route with form that relates to the parent resource

_ You must include a nested index or show route

_ Your forms should correctly display validation errors.

_ Your fields should be enclosed within a fields_with_errors class

_ Error messages describing the validation failures must be present within the view.

_ Your application must be, within reason, a DRY (Do-Not-Repeat-Yourself) rails app.

_ Logic present in your controllers should be encapsulated as methods in your models.

_ Your views should use helper methods and partials when appropriate.

_ Follow patterns in the Rails Style Guide and the Ruby Style Guide.

X Do not use scaffolding to build your project. Your goal here is to learn. Scaffold is a way to get up and running quickly, but learning a lot is not one of the benefits of scaffolding.