import { Injectable } from '@angular/core';
import { HttpClient, HttpResponse } from '@angular/common/http';
import { Observable } from 'rxjs';
import { ISector } from '../model/sector.model';

export type EntityResponseType = HttpResponse<ISector>;
export type EntityArrayResponseType = HttpResponse<ISector[]>;

@Injectable({ providedIn: 'root' })
export class SectorService {
    protected resourceUrl = 'api/sectors';

    constructor(protected http: HttpClient) {}

    create(sector: ISector): Observable<EntityResponseType> {
        return this.http.post<ISector>(this.resourceUrl, sector, { observe: 'response' });
    }

    update(sector: ISector): Observable<EntityResponseType> {
        return this.http.put<ISector>(`${this.resourceUrl}/${sector.id}`, sector, { observe: 'response' });
    }

    find(id: number): Observable<EntityResponseType> {
        return this.http.get<ISector>(`${this.resourceUrl}/${id}`, { observe: 'response' });
    }

    findAll(): Observable<EntityArrayResponseType> {
        return this.http.get<ISector[]>(this.resourceUrl, { observe: 'response' });
    }

    delete(id: number): Observable<HttpResponse<{}>> {
        return this.http.delete(`${this.resourceUrl}/${id}`, { observe: 'response' });
    }
}
