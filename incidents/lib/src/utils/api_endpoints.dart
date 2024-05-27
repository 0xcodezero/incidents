abstract class ApiEndpoints {
  const ApiEndpoints._();
  static String withBaseUrl(String endpoint) {
    // Base URL with Endpoints
    return "https://ba4caf56-6e45-4662-bbfb-20878b8cd42e.mock.pstmn.io$endpoint";
  }

  static const dashboard = '/dashboard';

  static List<E>? deserializeList<E>(
      List? list, E Function(dynamic j) fromJsonFunc) {
    if (list == null) return null;
    if (list.isEmpty) return [];
    return list.map((e) => fromJsonFunc(e)).toList();
  }
}
