typedef RegisterListenerFn<T> = void Function(ListenerFn<T> listener);
typedef ListenerFn<T> = void Function(T state);
