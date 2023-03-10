import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_ux/app/modules/detail_data_kehilangan/views/detail_data_kehilangan_view.dart';

class ListData extends StatefulWidget {
  Query dbRef = FirebaseDatabase.instance.ref().child('Data_Kehilangan');
  DatabaseReference reference =
      FirebaseDatabase.instance.ref().child('Data_Kehilangan');

  @override
  State<ListData> createState() => _ListDataState();
}

class _ListDataState extends State<ListData> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FirebaseAnimatedList(
        query: widget.dbRef,
        itemBuilder: (context, snapshot, animation, index) {
          Map Data_Kehilangan = snapshot.value as Map;
          Data_Kehilangan['key'] = snapshot.key;

          return listItem(Data_Kehilangan: Data_Kehilangan);
        },
      ),
    );
  }

  Widget listItem({required Map Data_Kehilangan}) {
    return Container(
      height: 110,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 82,
              height: 106,
              decoration: BoxDecoration(
                color: Color(0xFFEEEEEE),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.network(
                    Data_Kehilangan['image'],
                  ).image,
                ),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Color(0xFF656565),
                  width: 0.5,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailDataKehilanganView(
                            Data_Kehilangan, widget.reference)));
              },
              child: Container(
                width: 260,
                height: 106,
                decoration: BoxDecoration(
                  color: Colors.white,
                  // ignore: prefer_const_literals_to_create_immutables
                  boxShadow: [
                    // ignore: prefer_const_constructors
                    BoxShadow(
                      blurRadius: 6,
                      color: Color(0x34000000),
                      offset: Offset(0, 3),
                    )
                  ],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ignore: prefer_const_constructors
                    Padding(
                      // ignore: prefer_const_constructors
                      padding: EdgeInsetsDirectional.fromSTEB(12, 8, 0, 0),
                      // ignore: prefer_const_constructors
                      child: Text(
                        Data_Kehilangan["nama_barang"],
                        textAlign: TextAlign.start,
                        // ignore: prefer_const_constructors
                        style: TextStyle(
                          fontFamily: 'Lexend Deca',
                          color: Colors.blueGrey,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // ignore: prefer_const_constructors
                    Padding(
                      // ignore: prefer_const_constructors
                      padding: EdgeInsetsDirectional.fromSTEB(12, 5, 12, 0),
                      // ignore: prefer_const_constructors
                      child: Text(
                        Data_Kehilangan["deskripsi"],
                        // ignore: prefer_const_constructors
                        style: TextStyle(
                          fontFamily: 'Lexend Deca',
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    Padding(
                      // ignore: prefer_const_constructors
                      padding: EdgeInsets.only(top: 30, left: 15),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          // ignore: prefer_const_constructors
                          Icon(
                            Icons.price_change,
                            color: Colors.blueGrey,
                            size: 12,
                          ),
                          // ignore: prefer_const_constructors
                          Padding(
                            // ignore: prefer_const_constructors
                            padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                            // ignore: prefer_const_constructors
                            child: Text(
                              Data_Kehilangan["nama_pengadu"],
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                fontFamily: 'Lexend Deca',
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          // ignore: prefer_const_constructors
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            // ignore: prefer_const_constructors
                            child: Icon(
                              Icons.timelapse,
                              color: Colors.blueGrey,
                              size: 12,
                            ),
                          ),
                          // ig??ore: prefer_const_constructors
                          Padding(
                            // ignore: prefer_const_constructors
                            padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),

                            // ignore: prefer_const_constructors
                            child: Text(
                              // ignore: prefer_interpolation_to_compose_strings
                              Data_Kehilangan["date"],
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                fontFamily: 'Lexend Deca',
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
