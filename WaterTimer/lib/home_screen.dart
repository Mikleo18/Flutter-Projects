import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'water_tracker_model.dart';

class HomeScreen extends StatelessWidget 
{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      appBar: AppBar
      (
        title: const Text("Su Takip Uygulaması"),
        actions: 
        [
          IconButton
          (
            onPressed: ()
        {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> const logScreen()));
        },
         icon: const Icon(Icons.list))],
        ),
        body: Center(child: ElevatedButton(onPressed: ()
        {
          final currentTime =TimeOfDay.now().format(context);
          Provider.of<WaterTrackerModel>(context, listen: false).addLog(currentTime);
        },
         child: const Text("Su Ekle")),),
    );
  }
}

class logScreen extends StatelessWidget 
{
  const logScreen({super.key});

  @override
  Widget build(BuildContext context) 
  {
    final waterlog =Provider.of<WaterTrackerModel>(context).waterLog;
    return Scaffold
    (
      appBar: AppBar
      (
        title: const Text("İçilen Su Saatleri"),
      ),
      body: ListView.builder
      (
        itemCount:waterlog.length,
        itemBuilder: (context,index)
        {return 
        ListTile(leading: const Icon(Icons.local_drink),
        title: Text('Saat: ${waterlog[index]}'),
        trailing: IconButton(onPressed: ()
        {
          Provider.of<WaterTrackerModel>(context,listen:false).removelog(index);
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Veri Silindi"),duration: Duration(seconds: 2),));
        },  
        icon: const Icon(Icons.delete_forever) 
        ,color: Colors.red,),
        );
        },
      ),
    );
  }
}