# flutter_boilerplate_code

A new Flutter project.

## Getting Started

### How to config Provider?
1. Make a Model Class
    Create your data model in the data/ folder.

2. Create a Provider Class
    Make a class that extends ChangeNotifier and handles your logic and data.

3. Register the Provider in di_container

4. Wrap your app with MultiProvider in main.dart file:

5. Call Provider Method on Widget Load 
6. If needed, make your widget stateful. In initState(), add:

    WidgetsBinding.instance.addPostFrameCallback((_) {
    context.read<YourProvider>().yourMethod();
    });

7. Use Provider in UI with Consumer

     Consumer<YourProvider>(
     builder: (context, provider, child) {
     return Text(provider.someData);
     },
  );

