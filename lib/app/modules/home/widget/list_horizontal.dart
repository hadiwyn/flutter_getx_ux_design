import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../detail_data_penemuan/views/detail_data_penemuan_view.dart';

class ListHorizontal extends StatefulWidget {
  const ListHorizontal({super.key});

  @override
  State<ListHorizontal> createState() => _ListHorizontalState();
}

class _ListHorizontalState extends State<ListHorizontal> {
  Query dbRef = FirebaseDatabase.instance.ref().child('Data_Penemuan');
  DatabaseReference reference =
      FirebaseDatabase.instance.ref().child('Data_Penemuan');

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FirebaseAnimatedList(
        scrollDirection: Axis.horizontal,
        query: dbRef,
        itemBuilder: (context, snapshot, animation, index) {
          Map Data_Penemuan = snapshot.value as Map;
          Data_Penemuan['key'] = snapshot.key;

          return listItem(Data_Penemuan: Data_Penemuan);
        },
      ),
    );
  }

  Widget listItem({required Map Data_Penemuan}) {
    return Container(
      margin: const EdgeInsets.only(right: 5.0, left: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DetailDataPenemuanView(Data_Penemuan, reference)));
              print(Data_Penemuan);
            },
            child: Container(
              width: 323,
              height: 295,
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
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, top: 15, right: 15),
                    child: Container(
                      width: double.infinity,
                      height: 159,
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.network(
                            Data_Penemuan['image'],
                          ).image,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Color(0xFF656565),
                          width: 0.5,
                        ),
                      ),
                    ),
                  ),
                  // ignore: prefer_const_constructors
                  Padding(
                    // ignore: prefer_const_constructors
                    padding: EdgeInsetsDirectional.fromSTEB(15, 15, 0, 0),
                    // ignore: prefer_const_constructors
                    child: Text(
                      Data_Penemuan["nama_barang"],
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Color(0xFF1372A8)),
                      //  "${(listAllDocument[index].data() as Map<String, dynamic>)["nama"]}",
                      //   textAlign: TextAlign.start,
                      //   // ignore: prefer_const_constructors
                      //   style: TextStyle(
                      //     fontFamily: 'Lexend Deca',
                      //     color: Colors.blueGrey,
                      //     fontSize: 14,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                    ),
                  ),
                  // ignore: prefer_const_constructors
                  Padding(
                    // ignore: prefer_const_constructors
                    padding: EdgeInsetsDirectional.fromSTEB(15, 5, 15, 0),
                    // ignore: prefer_const_constructors
                    child: Text(Data_Penemuan["keterangan"],
                        style: GoogleFonts.inter(
                          fontSize: 12,
                        )
                        // "${(listAllDocument[index].data() as Map<String, dynamic>)["deskripsi"]}",
                        // // ignore: prefer_const_constructors
                        // style: TextStyle(
                        //   fontFamily: 'Lexend Deca',
                        //   fontSize: 12,
                        //   fontWeight: FontWeight.normal,
                        // ),
                        // textAlign: TextAlign.justify,
                        ),
                  ),
                  Padding(
                    // ignore: prefer_const_constructors
                    padding: EdgeInsetsDirectional.fromSTEB(15, 25, 15, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,

                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        // ignore: prefer_const_constructors
                        Image.asset(
                          "assets/icons/label.png",
                          height: 16,
                        ),
                        // ignore: prefer_const_constructors
                        Padding(
                          // ignore: prefer_const_constructors
                          padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                          // ignore: prefer_const_constructors
                          child: Text(
                            Data_Penemuan["nama_penemu"],
                            style: GoogleFonts.inter(fontSize: 12),
                            // "${(listAllDocument[index].data() as Map<String, dynamic>)["harga"]}",
                            // // ignore: prefer_const_constructors
                            // style: TextStyle(
                            //   fontFamily: 'Lexend Deca',
                            //   fontSize: 12,
                            //   fontWeight: FontWeight.w300,
                            // ),
                          ),
                        ),
                        SizedBox(
                          width: 89,
                        ),
                        // ignore: prefer_const_constructors
                        Padding(
                            padding: EdgeInsets.only(
                              left: 10,
                            ),
                            child: Image.asset(
                              "assets/icons/date_add.png",
                              height: 16,
                            )),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                          child: Text(
                            Data_Penemuan["date"],
                            style: GoogleFonts.inter(fontSize: 12),
                            // ignore: prefer_interpolation_to_compose_strings
                            // "${(listAllDocument[index].data() as Map<String, dynamic>)["time"]}",
                            // // ignore: prefer_const_constructors
                            // style: TextStyle(
                            //   fontFamily: 'Lexend Deca',
                            //   fontSize: 12,
                            //   fontWeight: FontWeight.w300,
                            // ),
                          ),
                        ),
                        // igčore: prefer_const_constructors
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
