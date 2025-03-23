import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_w_routes/models/list_model.dart';
import 'package:provider_w_routes/view_models/list_provider.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Screen'),
      ),
      body: Consumer<ListProvider>(
        builder: (ctx, listProvider, _){
          List<ListModel> data = ctx.watch<ListProvider>().getList();
          return listProvider.getList().isNotEmpty ? ListView.builder(
            itemCount: data.length,
            itemBuilder: (ctx, index){
              return ListTile(
                title: Text(data[index].title),
                subtitle: Text(data[index].sub),
                trailing: SizedBox(
                  width: 100,
                  child: Row(
                    children: [
                      IconButton(onPressed: ()=> ctx.read<ListProvider>().removeFromList(index), icon: const Icon(Icons.delete)),
                      IconButton(onPressed: ()=> ctx.read<ListProvider>().editList(
                        // {
                        //   'title' : 'Flutter',
                        //   'sub' : 'Provider with Routes'
                        // },
                        ListModel(title: 'Flutter', sub: 'Provider'),
                        index
                      ), icon: const Icon(Icons.edit))
                    ],
                  ),
                ),
              );
            }
          ) : const Center(child: Text('No Data Available'));
        }
      ),
      floatingActionButton: FloatingActionButton(onPressed: ()=>
        context.read<ListProvider>().addToList(
        //     {
        //   'title' : 'Arif',
        //   'sub' : 'Provider'
        // }
          ListModel(title: 'Arif', sub: 'Provider')
        ),
        child: const Icon(Icons.edit),),
    );
  }
}
