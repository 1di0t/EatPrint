import 'package:eat_print/api/error_api.dart';
import 'package:flutter/material.dart';

Widget checkPageLoading(context, snapshot) {
  if (snapshot.connectionState == ConnectionState.waiting) {
    //if is waiting for data show loading
    return Center(
        child: CircularProgressIndicator(
      color: Theme.of(context).primaryColor,
    ));
  } else if (snapshot.hasError) {
    return Center(child: Text('Error: ${checkSnapShotError(snapshot.error)}'));
  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
    //if no data show no post found
    return const Center(child: Text('No posts found.'));
  }
  return Container();
}
