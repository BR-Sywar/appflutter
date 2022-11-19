import "package:flutter/material.dart";

import '../../../LoginScreen/model/historyModel.dart';
import '../../../controllers/globalController.dart';
class Temperature extends StatelessWidget {
 Temperature({super.key});

   GlobalController globalController = GlobalController();




  @override
  Widget build(BuildContext context) {
    return FutureBuilder<HistoryModel?>(
      future: globalController.getAllData(),
      builder: (context, snapshot) {
        return
        !snapshot.hasData?
        Center(child: CircularProgressIndicator(),):
        
        
         Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
           //   child: Text("${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",style: Theme.of(context).textTheme.headline6,),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: snapshot.data!.response!.length,
                itemBuilder: (context, index){
                  int itemCount = snapshot.data!.response!.length  ;
                   int reversedIndex = itemCount - 1 - index;
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
            
                      // margin: EdgeInsets.symmetric(horizontal: 10),
            
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const[
                          BoxShadow(
                            blurRadius: 5,
                            color: Colors.black
                          )
                        ],
                        border: Border.all(color:Colors.white),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Temperature",style:TextStyle(fontWeight: FontWeight.bold)),
                                Text("Date",style:TextStyle(fontWeight: FontWeight.bold))
                              ],
                            ),
                            SizedBox(height:10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("${snapshot.data!.response![reversedIndex].temperature} °C"),
                                Text("${snapshot.data!.response![reversedIndex].date}")
                              ],
                            ),
                          ],
                        ),
                      ),
                      
                    ),
                  );
                }
              ),
            ),
          ],
        );
      }
    );
  }
}