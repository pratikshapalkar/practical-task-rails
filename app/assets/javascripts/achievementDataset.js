$('#achievementTable').DataTable({
  ajax:{ 
    url:'/achievement_dataset',
  serverSide: true,
},
  columns: [
    {award: 'Title', data: 'Title'},
    {gold_medal: 'Description', data: 'Description'},
    {silver_medal: 'User Id', data: 'User Id'},
    {bronze_medal: 'User Id', data: 'User Id'}
  ],
  order: [['1', 'desc']]
});