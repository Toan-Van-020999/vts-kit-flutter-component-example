
import 'package:flutter/material.dart';
import 'package:vts_component/vts_component.dart';
import 'package:vts_flutter_demo_pendo/components/demo_appbar.dart';

class ShimmerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DemoAppbar(title: 'Shimmer'),
      body: Container(
        padding: EdgeInsets.all(20),
        alignment: Alignment.center,
        child: FutureBuilder<String>(
          future: Future.delayed(Duration(seconds: 3))
              .then((value) => "Return value after 3s"),
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              return Row(children: [
                Container(
                  width: 50,
                  height: 50,
                  margin: EdgeInsets.only(right: 10),
                  child: Image.network(
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b4/Lionel-Messi-Argentina-2022-FIFA-World-Cup_%28cropped%29.jpg/220px-Lionel-Messi-Argentina-2022-FIFA-World-Cup_%28cropped%29.jpg",
                    fit: BoxFit.fill,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(snapshot.data!),
                      SizedBox(height: 10),
                      Text(snapshot.data!),
                    ],
                  ),
                ),
              ]);
            }
            return ExShimmerWidget();
          },
        ),
      ),
    );
  }
}

class ExShimmerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return VTSShimmer.fromColors(
      baseColor: Color(0xFFD1D1D1),
      highlightColor: Color(0xFFE9E9E9),
      child: Row(children: [
        Container(
          width: 50,
          height: 50,
          color: Colors.black,
        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                color: Colors.black,
                width: double.infinity,
                height: 20,
              ),
              SizedBox(height: 10),
              Container(
                color: Colors.black,
                width: double.infinity,
                height: 20,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
