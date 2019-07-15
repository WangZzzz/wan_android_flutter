/**
 * 基础TAB数据
 */
class BasePagingData<T> {
  int curPage;
  int offset;
  bool over;
  int pageCount;
  int size;
  int total;
  List<T> datas;

  BasePagingData(this.curPage, this.offset, this.over, this.pageCount, this.size,
      this.total, this.datas);
}
