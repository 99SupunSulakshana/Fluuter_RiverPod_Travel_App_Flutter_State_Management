# Fluuter_RiverPod_Travel_App_Flutter_State_Management
Flutter Travel App - RiverPod

#What is the Riverpod in Flutter?

Riverpod is a state management library. It is based on the provider package and provides an alternative method for handling state in Flutter apps. You can specify providers using Riverpod Flutter, which serves as the state's source of truth-fine-grained control over how the state is accessed and exchanged is possible with the help of these providers, which can be scoped to specific widget subtrees or inherited throughout the widget tree.

Utilizing Riverpod allows developers to separate UI elements from business logic, handle state changes efficiently, and reduce boilerplate codes.

Riverpod is a complete rewrite of the Provider package to make improvements that would be otherwise impossible.

Riverpod is a reactive caching and data-binding framework that was born as an evolution of the Provider package.

Riverpod is very versatile
- catch programming errors at compile-time rather than at runtime.
- easily fetch, cache, and update data from a remote source.
- perform reactive caching and easily update your UI.
- depend on the asynchronous or completed state.
- create, use, and combine providers with minimal boilerplate code.
- dispose of the state of a provider when it is no longer used.
-  write testable code and keep your logic outside the widget tree.

Riverpod implements well-defined patterns for retrieving and caching data, so you do not have to reimplement them.

#why use Riverpod?

- To understand why we even need Riverpod, let's look at the main drawback of the Provider package.
- By design, Provider is an improvement over InheritedWidget, and as such, it depends on the widget tree.
- Riverpod is compile-safe since all providers are declared globally and can be accessed anywhere.
- Riverpod is a reactive framework, it makes it easier to only rebuild your providers and widgets when needed.

#Eight different kinds of providers
1. Provider - access dependencies in our code
2. StateProvider - Manage local application state
3. StateNotifierProvider - Manage local application state
4. FutureProvider - cache asynchronous data from the network
5. StreamProvider - cache asynchronous data from the network
6. ChangeNotifierProvider - Manage local application state
7. AsyncNotifierProvider
8. NotifierProvider






